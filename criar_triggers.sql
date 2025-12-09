-- =========================================
-- SCRIPT 06: CRIAR TRIGGERS DE AUDITORIA
-- =========================================

-- ==========================================
-- FUNÇÃO GENÉRICA DE AUDITORIA
-- ==========================================

CREATE OR REPLACE FUNCTION epidemiologia.fn_auditar_alteracoes()
RETURNS TRIGGER AS $$
BEGIN
  -- Para INSERT
  IF (TG_OP = 'INSERT') THEN
      INSERT INTO epidemiologia.log_alteracoes (
          tabela_nome,
          operacao,
          usuario,
          registro_id,
          dados_novos,
          ip_address,
          aplicacao
      ) VALUES (
          TG_TABLE_NAME,
          TG_OP,
          current_user,
          NEW.notificacao_id,
          row_to_json(NEW)::jsonb,
          inet_client_addr(),
          current_setting('application_name', true)
      );
      RETURN NEW;
  
  -- Para UPDATE
  ELSIF (TG_OP = 'UPDATE') THEN
      INSERT INTO epidemiologia.log_alteracoes (
          tabela_nome,
          operacao,
          usuario,
          registro_id,
          dados_antigos,
          dados_novos,
          ip_address,
          aplicacao
      ) VALUES (
          TG_TABLE_NAME,
          TG_OP,
          current_user,
          NEW.notificacao_id,
          row_to_json(OLD)::jsonb,
          row_to_json(NEW)::jsonb,
          inet_client_addr(),
          current_setting('application_name', true)
      );
      RETURN NEW;
  
  -- Para DELETE
  ELSIF (TG_OP = 'DELETE') THEN
      INSERT INTO epidemiologia.log_alteracoes (
          tabela_nome,
          operacao,
          usuario,
          registro_id,
          dados_antigos,
          ip_address,
          aplicacao
      ) VALUES (
          TG_TABLE_NAME,
          TG_OP,
          current_user,
          OLD.notificacao_id,
          row_to_json(OLD)::jsonb,
          inet_client_addr(),
          current_setting('application_name', true)
      );
      RETURN OLD;
  END IF;
  
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- ==========================================
-- TRIGGERS PARA TABELA NOTIFICACAO
-- ==========================================

-- Remover triggers antigos se existirem
DROP TRIGGER IF EXISTS trg_notificacao_insert ON epidemiologia.notificacao;
DROP TRIGGER IF EXISTS trg_notificacao_update ON epidemiologia.notificacao;
DROP TRIGGER IF EXISTS trg_notificacao_delete ON epidemiologia.notificacao;

-- Trigger para INSERT
CREATE TRIGGER trg_notificacao_insert
AFTER INSERT ON epidemiologia.notificacao
FOR EACH ROW
EXECUTE FUNCTION epidemiologia.fn_auditar_alteracoes();

-- Trigger para UPDATE
CREATE TRIGGER trg_notificacao_update
AFTER UPDATE ON epidemiologia.notificacao
FOR EACH ROW
EXECUTE FUNCTION epidemiologia.fn_auditar_alteracoes();

-- Trigger para DELETE
CREATE TRIGGER trg_notificacao_delete
AFTER DELETE ON epidemiologia.notificacao
FOR EACH ROW
EXECUTE FUNCTION epidemiologia.fn_auditar_alteracoes();

-- ==========================================
-- VERIFICAÇÃO
-- ==========================================

-- Listar triggers criados
SELECT 
  trigger_name,
  event_manipulation,
  event_object_table,
  action_timing
FROM information_schema.triggers
WHERE trigger_schema = 'epidemiologia'
AND event_object_table = 'notificacao'
ORDER BY event_manipulation;

-- ==========================================
-- TESTAR TRIGGER (USANDO REGISTRO REAL)
-- ==========================================

-- Verificar se existem registros para testar
DO $$
DECLARE
  v_notificacao_id INTEGER;
  v_idade_original INTEGER;
BEGIN
  -- Pegar um notificacao_id existente
  SELECT notificacao_id, idade 
  INTO v_notificacao_id, v_idade_original
  FROM epidemiologia.notificacao 
  LIMIT 1;
  
  IF v_notificacao_id IS NOT NULL THEN
      -- Fazer um UPDATE de teste (será revertido)
      BEGIN
          -- Iniciar transação de teste
          UPDATE epidemiologia.notificacao 
          SET idade = v_idade_original + 1
          WHERE notificacao_id = v_notificacao_id;
          
          -- Verificar se log foi criado
          IF EXISTS (
              SELECT 1 FROM epidemiologia.log_alteracoes 
              WHERE tabela_nome = 'notificacao' 
                AND operacao = 'UPDATE'
                AND registro_id = v_notificacao_id
          ) THEN
              RAISE NOTICE '✅ Trigger funcionando! Log de UPDATE criado para notificacao_id=%', v_notificacao_id;
          ELSE
              RAISE NOTICE '❌ Trigger NÃO funcionou! Nenhum log foi criado.';
          END IF;
          
          -- Reverter a mudança
          UPDATE epidemiologia.notificacao 
          SET idade = v_idade_original
          WHERE notificacao_id = v_notificacao_id;
          
      EXCEPTION WHEN OTHERS THEN
          RAISE NOTICE 'Erro durante teste: %', SQLERRM;
      END;
  ELSE
      RAISE NOTICE 'ℹ️  Nenhum registro encontrado na tabela notificacao para testar. Execute o script 03_carga_fato.sql primeiro.';
  END IF;
END $$;

-- Ver últimos logs criados (se houver)
SELECT 
  log_id,
  tabela_nome,
  operacao,
  usuario,
  data_hora,
  registro_id
FROM epidemiologia.log_alteracoes
WHERE tabela_nome = 'notificacao'
ORDER BY log_id DESC
LIMIT 5;