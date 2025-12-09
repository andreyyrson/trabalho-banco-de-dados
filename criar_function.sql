-- SCRIPT 07: CRIAR FUNÇÕES (VERSÃO SIMPLIFICADA)
-- =========================================

-- Remover funções antigas
DROP FUNCTION IF EXISTS epidemiologia.fx_calcular_taxa_positividade(INTEGER, DATE, DATE);
DROP FUNCTION IF EXISTS epidemiologia.fx_tempo_medio_sintomas_testagem(INTEGER, DATE, DATE);
DROP FUNCTION IF EXISTS epidemiologia.fx_percentual_prof_saude_infectados(INTEGER, DATE, DATE);

-- ==========================================
-- TABELA DE INDICADORES (simplificada)
-- ==========================================

CREATE TABLE IF NOT EXISTS epidemiologia.indicadores_regionais (
indicador_id SERIAL PRIMARY KEY,
municipio_id INTEGER REFERENCES epidemiologia.municipio(municipio_id),
data_inicio DATE NOT NULL,
data_fim DATE NOT NULL,
taxa_positividade NUMERIC(5,2),
tempo_medio_testagem NUMERIC(10,2),
percentual_prof_saude NUMERIC(5,2),
data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
UNIQUE(municipio_id, data_inicio, data_fim)
);

-- ==========================================
-- FUNÇÃO 1: CALCULAR TAXA DE POSITIVIDADE
-- ==========================================

CREATE OR REPLACE FUNCTION epidemiologia.fx_calcular_taxa_positividade(
p_municipio_id INTEGER DEFAULT NULL,
p_data_inicio DATE DEFAULT NULL,
p_data_fim DATE DEFAULT NULL
)
RETURNS TABLE (
municipio TEXT,
total_testes BIGINT,
positivos BIGINT,
taxa_positividade NUMERIC
) AS $$
BEGIN
RETURN QUERY
SELECT 
    m.nome,
    COUNT(*) as total_testes,
    COUNT(*) FILTER (WHERE r.codigo = 'reagente_detectavel') as positivos,
    ROUND(
        COUNT(*) FILTER (WHERE r.codigo = 'reagente_detectavel')::NUMERIC / 
        COUNT(*)::NUMERIC * 100, 
        2
    ) as taxa_positividade
FROM epidemiologia.notificacao n
JOIN epidemiologia.municipio m ON m.municipio_id = n.municipio_notificacao_id
LEFT JOIN epidemiologia.resultado_teste1 r ON r.resultado1_id = n.resultado1_id
WHERE (p_municipio_id IS NULL OR n.municipio_notificacao_id = p_municipio_id)
  AND (p_data_inicio IS NULL OR n.data_notificacao >= p_data_inicio)
  AND (p_data_fim IS NULL OR n.data_notificacao <= p_data_fim)
  AND r.codigo IS NOT NULL
GROUP BY m.nome
ORDER BY taxa_positividade DESC;
END;
$$ LANGUAGE plpgsql;

-- ==========================================
-- FUNÇÃO 2: TEMPO MÉDIO ENTRE SINTOMAS E TESTAGEM
-- ==========================================

CREATE OR REPLACE FUNCTION epidemiologia.fx_tempo_medio_sintomas_testagem(
p_municipio_id INTEGER DEFAULT NULL,
p_data_inicio DATE DEFAULT NULL,
p_data_fim DATE DEFAULT NULL
)
RETURNS TABLE (
municipio TEXT,
casos INTEGER,
tempo_medio_dias NUMERIC
) AS $$
BEGIN
RETURN QUERY
SELECT 
    m.nome,
    COUNT(*)::INTEGER as casos,
    ROUND(AVG(n.data_coleta_teste1 - n.data_inicio_sintomas)::NUMERIC, 2) as tempo_medio_dias
FROM epidemiologia.notificacao n
JOIN epidemiologia.municipio m ON m.municipio_id = n.municipio_notificacao_id
WHERE n.data_inicio_sintomas IS NOT NULL 
  AND n.data_coleta_teste1 IS NOT NULL
  AND n.data_coleta_teste1 >= n.data_inicio_sintomas
  AND (p_municipio_id IS NULL OR n.municipio_notificacao_id = p_municipio_id)
  AND (p_data_inicio IS NULL OR n.data_notificacao >= p_data_inicio)
  AND (p_data_fim IS NULL OR n.data_notificacao <= p_data_fim)
GROUP BY m.nome
HAVING COUNT(*) >= 5
ORDER BY tempo_medio_dias;
END;
$$ LANGUAGE plpgsql;

-- ==========================================
-- FUNÇÃO 3: PERCENTUAL DE PROFISSIONAIS DE SAÚDE INFECTADOS
-- ==========================================

CREATE OR REPLACE FUNCTION epidemiologia.fx_percentual_prof_saude_infectados(
p_municipio_id INTEGER DEFAULT NULL,
p_data_inicio DATE DEFAULT NULL,
p_data_fim DATE DEFAULT NULL
)
RETURNS TABLE (
municipio TEXT,
total_casos INTEGER,
prof_saude_infectados INTEGER,
percentual NUMERIC
) AS $$
BEGIN
RETURN QUERY
SELECT 
    m.nome,
    COUNT(*)::INTEGER as total_casos,
    COUNT(*) FILTER (WHERE ps.status = TRUE)::INTEGER as prof_saude_infectados,
    ROUND(
        COUNT(*) FILTER (WHERE ps.status = TRUE)::NUMERIC / 
        COUNT(*)::NUMERIC * 100, 
        2
    ) as percentual
FROM epidemiologia.notificacao n
JOIN epidemiologia.municipio m ON m.municipio_id = n.municipio_notificacao_id
LEFT JOIN epidemiologia.profissional_saude ps ON ps.profissional_saude_id = n.profissional_saude_id
WHERE (p_municipio_id IS NULL OR n.municipio_notificacao_id = p_municipio_id)
  AND (p_data_inicio IS NULL OR n.data_notificacao >= p_data_inicio)
  AND (p_data_fim IS NULL OR n.data_notificacao <= p_data_fim)
GROUP BY m.nome
ORDER BY percentual DESC;
END;
$$ LANGUAGE plpgsql;

-- ==========================================
-- VERIFICAÇÕES
-- ==========================================

-- Listar funções criadas
SELECT 
routine_name as "Função Criada"
FROM information_schema.routines
WHERE routine_schema = 'epidemiologia'
AND routine_name LIKE 'fx_%'
ORDER BY routine_name;


-- Mensagem final
DO $$
BEGIN
RAISE NOTICE '===========================================';
RAISE NOTICE '✅ 3 FUNÇÕES CRIADAS COM SUCESSO!';
RAISE NOTICE '===========================================';
RAISE NOTICE '1. fx_calcular_taxa_positividade';
RAISE NOTICE '2. fx_tempo_medio_sintomas_testagem';
RAISE NOTICE '3. fx_percentual_prof_saude_infectados';
RAISE NOTICE '===========================================';
RAISE NOTICE 'Execute o script 09_testar_funcoes.sql';
RAISE NOTICE '===========================================';
END $$;

-- Uso básico (todos os municípios, todas as datas)
SELECT * FROM epidemiologia.fx_calcular_taxa_positividade();
SELECT * FROM epidemiologia.fx_tempo_medio_sintomas_testagem();
SELECT * FROM epidemiologia.fx_percentual_prof_saude_infectados();
