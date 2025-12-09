-- =========================================
-- SCRIPT 08: CRIAR VIEWS ANALÍTICAS
-- =========================================

-- ==========================================
-- 1. VIEW: CASOS POR MUNICÍPIO
-- ==========================================

CREATE OR REPLACE VIEW epidemiologia.vw_casos_por_municipio AS
SELECT 
  m.municipio_id,
  m.nome as municipio_nome,
  e.sigla as estado_sigla,
  DATE(n.data_notificacao) as data_notificacao,
  COUNT(*) as total_notificacoes,
  COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel')) as casos_confirmados,
  COUNT(*) FILTER (WHERE c.nome = 'descartado') as casos_descartados,
  COUNT(*) FILTER (WHERE c.nome = 'ignorado') as casos_em_investigacao,
  COUNT(*) FILTER (WHERE ev.nome = 'obito') as obitos,
  COUNT(*) FILTER (WHERE ev.nome = 'cura') as recuperados
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.municipio m ON m.municipio_id = n.municipio_notificacao_id
LEFT JOIN epidemiologia.estado e ON e.estado_id = m.estado_id
LEFT JOIN epidemiologia.classificacao c ON c.classificacao_id = n.classificacao_id
LEFT JOIN epidemiologia.evolucao ev ON ev.evolucao_id = n.evolucao_id
WHERE n.data_notificacao IS NOT NULL
GROUP BY m.municipio_id, m.nome, e.sigla, DATE(n.data_notificacao)
ORDER BY data_notificacao DESC, total_notificacoes DESC;

COMMENT ON VIEW epidemiologia.vw_casos_por_municipio IS 'Consolida total de notificações, casos confirmados e descartados por cidade e data';

-- ==========================================
-- 2. VIEW: VACINAÇÃO POR RESULTADO
-- ==========================================

CREATE OR REPLACE VIEW epidemiologia.vw_vacinacao_por_resultado AS
SELECT 
  r.codigo as resultado_teste,
  COUNT(*) as total_casos,
  COUNT(*) FILTER (WHERE n.data_primeira_dose IS NOT NULL) as com_primeira_dose,
  COUNT(*) FILTER (WHERE n.data_segunda_dose IS NOT NULL) as com_segunda_dose,
  COUNT(*) FILTER (WHERE n.data_primeira_dose IS NULL AND n.data_segunda_dose IS NULL) as nao_vacinados,
  ROUND(
      COUNT(*) FILTER (WHERE n.data_primeira_dose IS NOT NULL)::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
  ) as percentual_com_primeira_dose,
  ROUND(
      COUNT(*) FILTER (WHERE n.data_segunda_dose IS NOT NULL)::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
  ) as percentual_com_segunda_dose
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.resultado_teste1 r ON r.resultado1_id = n.resultado1_id
WHERE r.codigo IS NOT NULL
GROUP BY r.codigo
ORDER BY total_casos DESC;

COMMENT ON VIEW epidemiologia.vw_vacinacao_por_resultado IS 'Cruza resultados de teste com status vacinal';

-- ==========================================
-- 3. VIEW: SINTOMAS FREQUENTES
-- ==========================================

CREATE OR REPLACE VIEW epidemiologia.vw_sintomas_frequentes AS
SELECT 
  s.descricao as sintoma,
  COUNT(*) as total_casos,
  COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel')) as casos_confirmados,
  ROUND(
      COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel'))::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
  ) as percentual_confirmados,
  COUNT(*) FILTER (WHERE ev.nome = 'obito') as obitos,
  ROUND(
      COUNT(*) FILTER (WHERE ev.nome = 'obito')::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
  ) as taxa_letalidade
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.sintoma s ON s.sintoma_id = n.sintoma_id
LEFT JOIN epidemiologia.classificacao c ON c.classificacao_id = n.classificacao_id
LEFT JOIN epidemiologia.evolucao ev ON ev.evolucao_id = n.evolucao_id
WHERE s.descricao IS NOT NULL
GROUP BY s.descricao
HAVING COUNT(*) >= 10  -- Apenas sintomas com pelo menos 10 ocorrências
ORDER BY total_casos DESC;

COMMENT ON VIEW epidemiologia.vw_sintomas_frequentes IS 'Identifica os sintomas mais relatados entre casos confirmados';

-- ==========================================
-- 4. VIEW ADICIONAL: EVOLUÇÃO TEMPORAL
-- ==========================================

CREATE OR REPLACE VIEW epidemiologia.vw_evolucao_temporal AS
SELECT 
  DATE_TRUNC('month', n.data_notificacao) as mes,
  COUNT(*) as total_notificacoes,
  COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel')) as casos_confirmados,
  COUNT(*) FILTER (WHERE ev.nome = 'obito') as obitos,
  COUNT(*) FILTER (WHERE n.data_primeira_dose IS NOT NULL) as vacinados_primeira_dose,
  COUNT(*) FILTER (WHERE n.data_segunda_dose IS NOT NULL) as vacinados_segunda_dose,
  ROUND(
      COUNT(*) FILTER (WHERE ev.nome = 'obito')::NUMERIC / 
      NULLIF(COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel')), 0) * 100, 
      2
  ) as taxa_letalidade
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.classificacao c ON c.classificacao_id = n.classificacao_id
LEFT JOIN epidemiologia.evolucao ev ON ev.evolucao_id = n.evolucao_id
WHERE n.data_notificacao IS NOT NULL
GROUP BY DATE_TRUNC('month', n.data_notificacao)
ORDER BY mes;

COMMENT ON VIEW epidemiologia.vw_evolucao_temporal IS 'Evolução mensal dos casos, óbitos e vacinação';

-- ==========================================
-- 5. VIEW ADICIONAL: PERFIL DEMOGRÁFICO
-- ==========================================

CREATE OR REPLACE VIEW epidemiologia.vw_perfil_demografico AS
SELECT 
  CASE 
      WHEN n.idade < 18 THEN '0-17 anos'
      WHEN n.idade BETWEEN 18 AND 29 THEN '18-29 anos'
      WHEN n.idade BETWEEN 30 AND 49 THEN '30-49 anos'
      WHEN n.idade BETWEEN 50 AND 64 THEN '50-64 anos'
      WHEN n.idade >= 65 THEN '65+ anos'
      ELSE 'Não informado'
  END as faixa_etaria,
  sx.nome as sexo,
  rc.nome as raca,
  COUNT(*) as total_casos,
  COUNT(*) FILTER (WHERE c.nome IN ('confirmado', 'provavel')) as casos_confirmados,
  COUNT(*) FILTER (WHERE ev.nome = 'obito') as obitos,
  ROUND(
      COUNT(*) FILTER (WHERE ev.nome = 'obito')::NUMERIC / 
      NULLIF(COUNT(*), 0) * 100, 
      2
  ) as taxa_letalidade
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.sexo sx ON sx.sexo_id = n.sexo_id
LEFT JOIN epidemiologia.raca rc ON rc.raca_id = n.raca_id
LEFT JOIN epidemiologia.classificacao c ON c.classificacao_id = n.classificacao_id
LEFT JOIN epidemiologia.evolucao ev ON ev.evolucao_id = n.evolucao_id
GROUP BY faixa_etaria, sx.nome, rc.nome
ORDER BY faixa_etaria, sexo, raca;

COMMENT ON VIEW epidemiologia.vw_perfil_demografico IS 'Perfil demográfico dos casos por idade, sexo e raça';
-- ==========================================
-- VERIFICAÇÕES
-- ==========================================

-- Listar views criadas
SELECT 
  table_name as view_name,
  view_definition
FROM information_schema.views
WHERE table_schema = 'epidemiologia'
AND table_name LIKE 'vw_%'
ORDER BY table_name;

-- Testar views
SELECT * FROM epidemiologia.vw_casos_por_municipio LIMIT 10;
SELECT * FROM epidemiologia.vw_vacinacao_por_resultado;
SELECT * FROM epidemiologia.vw_sintomas_frequentes LIMIT 10;
SELECT * FROM epidemiologia.vw_evolucao_temporal LIMIT 12;
SELECT * FROM epidemiologia.vw_perfil_demografico LIMIT 20;