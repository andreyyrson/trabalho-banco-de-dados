-- =========================================
-- SCRIPT 03: CARGA DA TABELA FATO
-- =========================================
-- IMPORTANTE: Execute este script no pgAdmin ou DBeaver
-- ORDEM: Executar DEPOIS do script 02

-- 1. Verificar staging
SELECT COUNT(*) as registros_staging FROM epidemiologia.staging_dados;

-- 2. Limpar tabela fato (se necessário recarregar)
TRUNCATE TABLE epidemiologia.notificacao;

-- 3. Inserir na tabela fato
INSERT INTO epidemiologia.notificacao (
  sexo_id, 
  raca_id, 
  profissional_saude_id, 
  profissional_seguranca_id,
  estado_origem_id, 
  municipio_origem_id,
  estado_notificacao_id, 
  municipio_notificacao_id,
  evolucao_id, 
  classificacao_id, 
  estrategia_id,
  resultado1_id,
  origem_id,
  sintoma_id,
  laboratorio_primeira_dose_id,
  laboratorio_segunda_dose_id,
  lote_primeira_dose,
  lote_segunda_dose,
  data_notificacao, 
  data_inicio_sintomas, 
  data_encerramento,
  data_primeira_dose, 
  data_segunda_dose, 
  data_coleta_teste1,
  idade, 
  total_testes, 
  raw_line
)
SELECT
  s_sexo.sexo_id,
  s_raca.raca_id,
  s_prof_saude.profissional_saude_id,
  s_prof_seg.profissional_seguranca_id,
  s_estado_orig.estado_id,
  s_mun_orig.municipio_id,
  s_estado_notif.estado_id,
  s_mun_notif.municipio_id,
  s_evolucao.evolucao_id,
  s_classif.classificacao_id,
  s_estrategia.estrategia_id,
  s_resultado.resultado1_id,
  s_origem.origem_id,
  s_sintoma.sintoma_id,
  s_lab_primeira.laboratorio_id,
  s_lab_segunda.laboratorio_id,
  s_lote_primeira.lote_id,
  s_lote_segunda.lote_id,
  CAST(NULLIF(stg.datanotificacao, '') AS DATE),
  CAST(NULLIF(stg.datainiciosintomas, '') AS DATE),
  CAST(NULLIF(stg.dataencerramento, '') AS DATE),
  CAST(NULLIF(stg.dataprimeiradose, '') AS DATE),
  CAST(NULLIF(stg.datasegundadose, '') AS DATE),
  CAST(NULLIF(stg.datacoletateste1, '') AS DATE),
  FLOOR(CAST(NULLIF(stg.idade, '') AS NUMERIC))::INTEGER,
  FLOOR(CAST(NULLIF(stg.totaltestesrealizados, '') AS NUMERIC))::INTEGER,
  stg.raw_line
FROM epidemiologia.staging_dados stg
LEFT JOIN epidemiologia.sexo s_sexo 
  ON s_sexo.nome = LOWER(stg.sexo)
LEFT JOIN epidemiologia.raca s_raca 
  ON s_raca.nome = LOWER(stg.racacor)
LEFT JOIN epidemiologia.profissional_saude s_prof_saude 
  ON s_prof_saude.status = (LOWER(stg.profissionalsaude) = 'sim')
LEFT JOIN epidemiologia.profissional_seguranca s_prof_seg 
  ON s_prof_seg.status = (LOWER(stg.profissionalseguranca) = 'sim')
LEFT JOIN epidemiologia.estado s_estado_orig 
  ON s_estado_orig.sigla = UPPER(stg.estadoibge)
LEFT JOIN epidemiologia.municipio s_mun_orig 
  ON s_mun_orig.codigo_ibge = FLOOR(CAST(NULLIF(stg.municipioibge, '') AS NUMERIC))::INTEGER
LEFT JOIN epidemiologia.estado s_estado_notif 
  ON s_estado_notif.sigla = UPPER(stg.estadonotificacaoibge)
LEFT JOIN epidemiologia.municipio s_mun_notif 
  ON s_mun_notif.codigo_ibge = FLOOR(CAST(NULLIF(stg.municipionotificacaoibge, '') AS NUMERIC))::INTEGER
LEFT JOIN epidemiologia.evolucao s_evolucao 
  ON s_evolucao.nome = LOWER(stg.evolucaocaso)
LEFT JOIN epidemiologia.classificacao s_classif 
  ON s_classif.nome = LOWER(stg.classificacaofinal)
LEFT JOIN epidemiologia.estrategia_covid s_estrategia 
  ON s_estrategia.codigo = LOWER(stg.codigoestrategiacovid)
LEFT JOIN epidemiologia.resultado_teste1 s_resultado 
  ON s_resultado.codigo = LOWER(stg.codigoresultadoteste1)
LEFT JOIN epidemiologia.origem s_origem 
  ON s_origem.nome = LOWER(stg.origem)
LEFT JOIN epidemiologia.sintoma s_sintoma 
  ON s_sintoma.descricao = LOWER(stg.sintomas)
LEFT JOIN epidemiologia.laboratorio s_lab_primeira  
  ON s_lab_primeira.nome = LOWER(stg.codigolaboratorioprimeiradose)
LEFT JOIN epidemiologia.laboratorio s_lab_segunda   
  ON s_lab_segunda.nome = LOWER(stg.codigolaboratoriosegundadose)
LEFT JOIN epidemiologia.lote s_lote_primeira
  ON s_lote_primeira.codigo = LOWER(stg.loteprimeiradose)
LEFT JOIN epidemiologia.lote s_lote_segunda
  ON s_lote_segunda.codigo = LOWER(stg.lotesegundadose);

-- 4. Verificar inserção
SELECT COUNT(*) as total_fato FROM epidemiologia.notificacao;

-- 5. Resumo rápido
SELECT 
  'Total de registros' as metrica,
  COUNT(*) as valor
FROM epidemiologia.notificacao
UNION ALL
SELECT 
  'Com todas dimensões preenchidas',
  COUNT(*)
FROM epidemiologia.notificacao
WHERE sexo_id IS NOT NULL 
AND raca_id IS NOT NULL 
AND evolucao_id IS NOT NULL;