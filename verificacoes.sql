-- =========================================
-- SCRIPT 04: VERIFICAÇÕES DE QUALIDADE
-- =========================================

-- 1. Verificar registros NULL por dimensão
SELECT 
  COUNT(*) as total_registros,
  COUNT(*) FILTER (WHERE sexo_id IS NULL) as sem_sexo,
  COUNT(*) FILTER (WHERE raca_id IS NULL) as sem_raca,
  COUNT(*) FILTER (WHERE origem_id IS NULL) as sem_origem,
  COUNT(*) FILTER (WHERE sintoma_id IS NULL) as sem_sintoma,
  COUNT(*) FILTER (WHERE evolucao_id IS NULL) as sem_evolucao,
  COUNT(*) FILTER (WHERE classificacao_id IS NULL) as sem_classificacao,
  COUNT(*) FILTER (WHERE laboratorio_primeira_dose_id IS NULL) as sem_lab_primeira,
  COUNT(*) FILTER (WHERE laboratorio_segunda_dose_id IS NULL) as sem_lab_segunda,
  COUNT(*) FILTER (WHERE lote_primeira_dose IS NULL) as sem_lote_primeira,
  COUNT(*) FILTER (WHERE lote_segunda_dose IS NULL) as sem_lote_segunda
FROM epidemiologia.notificacao;

-- 2. Distribuição por sexo
SELECT s.nome, COUNT(*) as total
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.sexo s ON s.sexo_id = n.sexo_id
GROUP BY s.nome
ORDER BY total DESC;

-- 3. Distribuição por raça
SELECT r.nome, COUNT(*) as total
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.raca r ON r.raca_id = n.raca_id
GROUP BY r.nome
ORDER BY total DESC;

-- 4. Distribuição por evolução do caso
SELECT e.nome, COUNT(*) as total
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.evolucao e ON e.evolucao_id = n.evolucao_id
GROUP BY e.nome
ORDER BY total DESC;

-- 5. Top 10 municípios com mais notificações
SELECT m.nome, e.sigla, COUNT(*) as total
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.municipio m ON m.municipio_id = n.municipio_notificacao_id
LEFT JOIN epidemiologia.estado e ON e.estado_id = m.estado_id
GROUP BY m.nome, e.sigla
ORDER BY total DESC
LIMIT 10;

-- 6. Distribuição por laboratório (primeira dose)
SELECT l.nome, COUNT(*) as total
FROM epidemiologia.notificacao n
LEFT JOIN epidemiologia.laboratorio l ON l.laboratorio_id = n.laboratorio_primeira_dose_id
GROUP BY l.nome
ORDER BY total DESC;

-- 7. Notificações por mês
SELECT 
  TO_CHAR(data_notificacao, 'YYYY-MM') as mes,
  COUNT(*) as total_notificacoes
FROM epidemiologia.notificacao
WHERE data_notificacao IS NOT NULL
GROUP BY TO_CHAR(data_notificacao, 'YYYY-MM')
ORDER BY mes;

-- 8. Faixa etária
SELECT 
  CASE 
      WHEN idade < 18 THEN '0-17'
      WHEN idade BETWEEN 18 AND 29 THEN '18-29'
      WHEN idade BETWEEN 30 AND 49 THEN '30-49'
      WHEN idade BETWEEN 50 AND 64 THEN '50-64'
      WHEN idade >= 65 THEN '65+'
      ELSE 'Não informado'
  END as faixa_etaria,
  COUNT(*) as total
FROM epidemiologia.notificacao
GROUP BY faixa_etaria
ORDER BY faixa_etaria;