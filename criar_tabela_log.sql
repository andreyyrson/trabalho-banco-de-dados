-- =========================================
-- SCRIPT 05: CRIAR TABELA DE LOG/AUDITORIA
-- =========================================

-- Criar tabela de log de alterações
CREATE TABLE IF NOT EXISTS epidemiologia.log_alteracoes (
  log_id SERIAL PRIMARY KEY,
  tabela_nome VARCHAR(100) NOT NULL,
  operacao VARCHAR(10) NOT NULL CHECK (operacao IN ('INSERT', 'UPDATE', 'DELETE')),
  usuario VARCHAR(100) NOT NULL,
  data_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  registro_id INTEGER,
  dados_antigos JSONB,
  dados_novos JSONB,
  ip_address INET,
  aplicacao VARCHAR(200)
);

-- Criar índices para otimizar consultas no log
CREATE INDEX IF NOT EXISTS idx_log_tabela ON epidemiologia.log_alteracoes(tabela_nome);
CREATE INDEX IF NOT EXISTS idx_log_operacao ON epidemiologia.log_alteracoes(operacao);
CREATE INDEX IF NOT EXISTS idx_log_data_hora ON epidemiologia.log_alteracoes(data_hora);
CREATE INDEX IF NOT EXISTS idx_log_usuario ON epidemiologia.log_alteracoes(usuario);

-- Comentários
COMMENT ON TABLE epidemiologia.log_alteracoes IS 'Tabela de auditoria para rastrear todas as alterações nas tabelas principais';
COMMENT ON COLUMN epidemiologia.log_alteracoes.dados_antigos IS 'Dados antes da alteração (formato JSON)';
COMMENT ON COLUMN epidemiologia.log_alteracoes.dados_novos IS 'Dados após a alteração (formato JSON)';

-- Verificar criação
SELECT COUNT(*) as total_logs FROM epidemiologia.log_alteracoes;