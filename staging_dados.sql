-- Comando correto para limpar a tabela
TRUNCATE TABLE epidemiologia.staging_dados;

-- Importar novamente
\copy epidemiologia.staging_dados(sintomas, profissionalsaude, racacor, profissionalseguranca, sexo, estado, estadoibge, municipio, municipioibge, origem, estadonotificacao, municipionotificacao, municipionotificacaoibge, evolucaocaso, classificacaofinal, codigoestrategiacovid, codigolocalrealizacaotestagem, codigorecebeuvacina, codigolaboratorioprimeiradose, codigolaboratoriosegundadose, loteprimeiradose, lotesegundadose, codigocontemcomunidadetradicional, source_id, excluido, validado, codigodosesvacina, estadonotificacaoibge, totaltestesrealizados, datanotificacao, datainiciosintomas, dataencerramento, dataprimeiradose, datasegundadose, codigoestadoteste1, codigotipoteste1, codigofabricanteteste1, codigoresultadoteste1, datacoletateste1, idade, raw_line) FROM 'C:/Users/PC/trabalho-banco-de-dados/staging_data_fixed.csv' WITH (FORMAT CSV, HEADER true, DELIMITER '|', ENCODING 'UTF8');

-- Verificar
SELECT COUNT(*) FROM epidemiologia.staging_dados;