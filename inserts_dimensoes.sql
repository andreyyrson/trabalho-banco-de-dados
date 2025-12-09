-- =========================================
-- SCRIPT DE INSERÇÃO DE DADOS
-- =========================================

-- Inserir dados na tabela sexo
INSERT INTO epidemiologia.sexo (nome) VALUES ('feminino') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.sexo (nome) VALUES ('masculino') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela raca
INSERT INTO epidemiologia.raca (nome) VALUES ('amarela') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.raca (nome) VALUES ('parda') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.raca (nome) VALUES ('branca') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.raca (nome) VALUES ('preta') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.raca (nome) VALUES ('ignorado') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.raca (nome) VALUES ('indigena') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela evolucao
INSERT INTO epidemiologia.evolucao (nome) VALUES ('cura') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.evolucao (nome) VALUES ('ignorado') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.evolucao (nome) VALUES ('obito') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.evolucao (nome) VALUES ('internado') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela classificacao
INSERT INTO epidemiologia.classificacao (nome) VALUES ('ignorado') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.classificacao (nome) VALUES ('descartado') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela estrategia_covid
INSERT INTO epidemiologia.estrategia_covid (codigo) VALUES ('sintomatico') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estrategia_covid (codigo) VALUES ('contato') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estrategia_covid (codigo) VALUES ('testagem_massa') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estrategia_covid (codigo) VALUES ('ignorado') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela resultado_teste1
INSERT INTO epidemiologia.resultado_teste1 (codigo) VALUES ('nao_reagente_nao_detectavel') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.resultado_teste1 (codigo) VALUES ('reagente_detectavel') ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.resultado_teste1 (codigo) VALUES ('ignorado') ON CONFLICT DO NOTHING;

-- Inserir dados na tabela profissional_saude
INSERT INTO epidemiologia.profissional_saude (status) VALUES (TRUE) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.profissional_saude (status) VALUES (FALSE) ON CONFLICT DO NOTHING;

-- Inserir dados na tabela profissional_seguranca
INSERT INTO epidemiologia.profissional_seguranca (status) VALUES (TRUE) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.profissional_seguranca (status) VALUES (FALSE) ON CONFLICT DO NOTHING;

-- Inserir dados na tabela estado
-- Inserir dados na tabela estado

-- Inserir estados de notificação

-- Inserir dados na tabela estado
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('AC', 12) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('AL', 27) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('AM', 13) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('AP', 16) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('BA', 29) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('CE', 23) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('DF', 53) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('ES', 32) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('GO', 52) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('MA', 21) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('MG', 31) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('MS', 50) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('MT', 51) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('PA', 15) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('PB', 25) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('PE', 26) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('PI', 22) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('PR', 41) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('RJ', 33) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('RN', 24) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('RO', 11) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('RR', 14) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('RS', 43) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('SC', 42) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('SE', 28) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('SP', 35) ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.estado (sigla, codigo_ibge) VALUES ('TO', 17) ON CONFLICT DO NOTHING;

-- Inserir dados na tabela municipio
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alta Floresta D''Oeste', 1100015, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ariquemes', 1100023, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cacoal', 1100049, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cerejeiras', 1100056, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Espigão D''Oeste', 1100098, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ji-Paraná', 1100122, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ouro Preto Do Oeste', 1100155, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pimenta Bueno', 1100189, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Velho', 1100205, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rolim De Moura', 1100288, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vilhena', 1100304, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Paraíso', 1100403, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Novo De Rondônia', 1100700, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itapuã Do Oeste', 1101104, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monte Negro', 1101401, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Seringueiras', 1101500, estado_id FROM epidemiologia.estado WHERE sigla = 'RO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cruzeiro Do Sul', 1200203, estado_id FROM epidemiologia.estado WHERE sigla = 'AC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Epitaciolândia', 1200252, estado_id FROM epidemiologia.estado WHERE sigla = 'AC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Plácido De Castro', 1200385, estado_id FROM epidemiologia.estado WHERE sigla = 'AC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Branco', 1200401, estado_id FROM epidemiologia.estado WHERE sigla = 'AC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Apuí', 1300144, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Canutama', 1300904, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Coari', 1301209, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Eirunepé', 1301407, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Humaitá', 1301704, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Iranduba', 1301852, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itacoatiara', 1301902, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lábrea', 1302405, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Manacapuru', 1302504, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Manaus', 1302603, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Manicoré', 1302702, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maués', 1302900, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nhamundá', 1303007, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Olinda Do Norte', 1303106, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Novo Aripuanã', 1303304, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Parintins', 1303403, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Preto Da Eva', 1303569, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Sebastião Do Uatumã', 1303957, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tefé', 1304203, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Urucurituba', 1304401, estado_id FROM epidemiologia.estado WHERE sigla = 'AM' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Boa Vista', 1400100, estado_id FROM epidemiologia.estado WHERE sigla = 'RR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caracaraí', 1400209, estado_id FROM epidemiologia.estado WHERE sigla = 'RR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pacaraima', 1400456, estado_id FROM epidemiologia.estado WHERE sigla = 'RR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rorainópolis', 1400472, estado_id FROM epidemiologia.estado WHERE sigla = 'RR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Abaetetuba', 1500107, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Abel Figueiredo', 1500131, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Acará', 1500206, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Afuá', 1500305, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Água Azul Do Norte', 1500347, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alenquer', 1500404, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Almeirim', 1500503, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Altamira', 1500602, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Anajás', 1500701, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ananindeua', 1500800, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Anapu', 1500859, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Augusto Corrêa', 1500909, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aurora Do Pará', 1500958, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aveiro', 1501006, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bagre', 1501105, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Baião', 1501204, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bannach', 1501253, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barcarena', 1501303, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belém', 1501402, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belterra', 1501451, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Benevides', 1501501, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jesus Do Tocantins', 1501576, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bonito', 1501600, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bragança', 1501709, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brasil Novo', 1501725, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brejo Grande Do Araguaia', 1501758, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Breu Branco', 1501782, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Breves', 1501808, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bujaru', 1501907, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cachoeira Do Piriá', 1501956, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cachoeira Do Arari', 1502004, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cametá', 1502103, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Canaã Dos Carajás', 1502152, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Capanema', 1502202, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Capitão Poço', 1502301, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Castanhal', 1502400, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Chaves', 1502509, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colares', 1502608, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Conceição Do Araguaia', 1502707, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Concórdia Do Pará', 1502756, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cumaru Do Norte', 1502764, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curionópolis', 1502772, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curralinho', 1502806, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curuá', 1502855, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curuçá', 1502905, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Dom Eliseu', 1502939, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Eldorado Do Carajás', 1502954, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Faro', 1503002, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Floresta Do Araguaia', 1503044, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Garrafão Do Norte', 1503077, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Goianésia Do Pará', 1503093, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gurupá', 1503101, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Igarapé-Açu', 1503200, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Igarapé-Miri', 1503309, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Inhangapi', 1503408, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ipixuna Do Pará', 1503457, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Irituia', 1503507, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaituba', 1503606, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itupiranga', 1503705, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jacareacanga', 1503754, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jacundá', 1503804, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juruti', 1503903, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Limoeiro Do Ajuru', 1504000, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mãe Do Rio', 1504059, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Magalhães Barata', 1504109, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marabá', 1504208, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maracanã', 1504307, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marapanim', 1504406, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marituba', 1504422, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Medicilândia', 1504455, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Melgaço', 1504505, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mocajuba', 1504604, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Moju', 1504703, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mojuí Dos Campos', 1504752, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monte Alegre', 1504802, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Muaná', 1504901, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Esperança Do Piriá', 1504950, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Ipixuna', 1504976, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Timboteua', 1505007, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Novo Progresso', 1505031, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Novo Repartimento', 1505064, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Óbidos', 1505106, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Oeiras Do Pará', 1505205, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Oriximiná', 1505304, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ourém', 1505403, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ourilândia Do Norte', 1505437, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pacajá', 1505486, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palestina Do Pará', 1505494, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paragominas', 1505502, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Parauapebas', 1505536, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pau D''Arco', 1505551, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Peixe-Boi', 1505601, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Piçarra', 1505635, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Placas', 1505650, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ponta De Pedras', 1505700, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Portel', 1505809, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto De Moz', 1505908, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Prainha', 1506005, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Primavera', 1506104, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Quatipuru', 1506112, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Redenção', 1506138, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Maria', 1506161, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rondon Do Pará', 1506187, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rurópolis', 1506195, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Salinópolis', 1506203, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Salvaterra', 1506302, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Bárbara Do Pará', 1506351, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Cruz Do Arari', 1506401, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Izabel Do Pará', 1506500, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Luzia Do Pará', 1506559, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Maria Das Barreiras', 1506583, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Maria Do Pará', 1506609, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santana Do Araguaia', 1506708, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santarém', 1506807, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santarém Novo', 1506906, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santo Antônio Do Tauá', 1507003, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Caetano De Odivelas', 1507102, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Domingos Do Araguaia', 1507151, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Domingos Do Capim', 1507201, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Félix Do Xingu', 1507300, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Francisco Do Pará', 1507409, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Geraldo Do Araguaia', 1507458, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João Da Ponta', 1507466, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João De Pirabas', 1507474, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João Do Araguaia', 1507508, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Miguel Do Guamá', 1507607, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Sebastião Da Boa Vista', 1507706, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sapucaia', 1507755, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Senador José Porfírio', 1507805, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Soure', 1507904, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tailândia', 1507953, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Terra Alta', 1507961, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Terra Santa', 1507979, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tomé-Açu', 1508001, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tracuateua', 1508035, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Trairão', 1508050, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tucumã', 1508084, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tucuruí', 1508100, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ulianópolis', 1508126, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Uruará', 1508159, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vigia', 1508209, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Viseu', 1508308, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vitória Do Xingu', 1508357, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Xinguara', 1508407, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Amapá', 1600105, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pedra Branca Do Amapari', 1600154, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Laranjal Do Jari', 1600279, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Macapá', 1600303, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mazagão', 1600402, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Oiapoque', 1600501, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Grande', 1600535, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santana', 1600600, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vitória Do Jari', 1600808, estado_id FROM epidemiologia.estado WHERE sigla = 'AP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ananás', 1701002, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aragominas', 1701309, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araguacema', 1701903, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araguaína', 1702109, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araguatins', 1702208, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Arapoema', 1702307, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Augustinópolis', 1702554, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Axixá Do Tocantins', 1702901, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jesus Do Tocantins', 1703305, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Buriti Do Tocantins', 1703800, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carrasco Bonito', 1703891, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colinas Do Tocantins', 1705508, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Couto Magalhães', 1706001, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Divinópolis Do Tocantins', 1707108, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Esperantina', 1707405, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fátima', 1707553, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Formoso Do Araguaia', 1708205, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fortaleza Do Tabocão', 1708254, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Goiatins', 1709005, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gurupi', 1709500, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lajeado', 1712009, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmeiras Do Tocantins', 1713809, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Novo Acordo', 1715101, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmeirante', 1715705, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paraíso Do Tocantins', 1716109, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pau D''Arco', 1716307, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pedro Afonso', 1716505, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Peixe', 1716604, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Nacional', 1718204, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sampaio', 1718808, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sandolândia', 1718840, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Fé Do Araguaia', 1718865, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Miguel Do Tocantins', 1720200, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Sebastião Do Tocantins', 1720309, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sítio Novo Do Tocantins', 1720804, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmas', 1721000, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tocantínia', 1721109, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tocantinópolis', 1721208, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tupirama', 1721257, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Wanderlândia', 1722081, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Xambioá', 1722107, estado_id FROM epidemiologia.estado WHERE sigla = 'TO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Açailândia', 2100055, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Alegre Do Maranhão', 2100436, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Alegre Do Pindaré', 2100477, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Parnaíba', 2100501, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Amapá Do Maranhão', 2100550, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Amarante Do Maranhão', 2100600, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Apicum-Açu', 2100832, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Arari', 2101004, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bacabal', 2101202, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bacuri', 2101301, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Balsas', 2101400, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barra Do Corda', 2101608, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Boa Vista Do Gurupi', 2101970, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jardim', 2102002, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jesus Das Selvas', 2102036, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Lugar', 2102077, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brejo De Areia', 2102150, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Buriticupu', 2102325, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Buritirana', 2102358, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cândido Mendes', 2102606, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carolina', 2102804, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carutapera', 2102903, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caxias', 2103000, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Centro Novo Do Maranhão', 2103174, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cidelândia', 2103257, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Codó', 2103307, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Coelho Neto', 2103406, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colinas', 2103505, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Coroatá', 2103604, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cururupu', 2103703, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Davinópolis', 2103752, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Estreito', 2104057, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fortuna', 2104206, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Godofredo Viana', 2104305, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Governador Newton Bello', 2104651, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Grajaú', 2104800, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Imperatriz', 2105302, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaipava Do Grajaú', 2105351, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itapecuru Mirim', 2105401, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itinga Do Maranhão', 2105427, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lago Da Pedra', 2105708, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lago Verde', 2105906, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lago Dos Rodrigues', 2105948, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Luís Domingues', 2106201, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maracaçumé', 2106326, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marajá Do Sena', 2106359, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maranhãozinho', 2106375, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Matões Do Norte', 2106631, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Miranda Do Norte', 2106755, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mirinzal', 2106805, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monção', 2106904, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Olinda Do Maranhão', 2107357, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Olinda Nova Do Maranhão', 2107456, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paço Do Lumiar', 2107506, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmeirândia', 2107605, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paraibano', 2107704, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pastos Bons', 2108009, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pedreiras', 2108207, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pindaré-Mirim', 2108504, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pinheiro', 2108603, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pio Xii', 2108702, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pirapemas', 2108801, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Poção De Pedras', 2108900, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Franco', 2109007, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Presidente Dutra', 2109106, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Presidente Sarney', 2109270, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ribamar Fiquene', 2109551, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Helena', 2109809, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Inês', 2109908, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Luzia', 2110005, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Luzia Do Paruá', 2110039, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João Do Soter', 2111078, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José De Ribamar', 2111201, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Luís', 2111300, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Luís Gonzaga Do Maranhão', 2111409, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Pedro Da Água Branca', 2111532, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Pedro Dos Crentes', 2111573, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tuntum', 2112308, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Turiaçu', 2112407, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Turilândia', 2112456, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vargem Grande', 2112704, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Viana', 2112803, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vitorino Freire', 2113009, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Zé Doca', 2114007, estado_id FROM epidemiologia.estado WHERE sigla = 'MA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Maior', 2202208, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Canto Do Buriti', 2202307, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Dom Expedito Lopes', 2203404, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gilbués', 2204402, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Luís Correia', 2205706, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Madeiro', 2205854, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Manoel Emídio', 2205904, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monsenhor Hipólito', 2206506, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nossa Senhora Dos Remédios', 2206803, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Oeiras', 2207009, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pajeú Do Piauí', 2207355, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Patos Do Piauí', 2207777, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paulistana', 2207801, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Picos', 2208007, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Regeneração', 2208809, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Rosa Do Piauí', 2209377, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Julião', 2210300, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Teresina', 2211001, estado_id FROM epidemiologia.estado WHERE sigla = 'PI' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barro', 2302008, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campos Sales', 2302701, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caririaçu', 2303204, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caucaia', 2303709, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fortaleza', 2304400, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fortim', 2304459, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Frecheirinha', 2304509, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Hidrolândia', 2305209, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaitinga', 2306256, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itapipoca', 2306405, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juazeiro Do Norte', 2307304, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maracanaú', 2307650, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maranguape', 2307700, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Missão Velha', 2308401, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Morada Nova', 2308708, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palhano', 2310001, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paracuru', 2310209, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pedra Branca', 2310506, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Quixadá', 2311306, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Redenção', 2311603, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Russas', 2311801, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Senador Pompeu', 2312700, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sobral', 2312908, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ubajara', 2313609, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Umari', 2313708, estado_id FROM epidemiologia.estado WHERE sigla = 'CE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Do Rodrigues', 2400703, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Parnamirim', 2403251, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Francisco Dantas', 2403905, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Grossos', 2404408, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lagoa Salgada', 2406601, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monte Alegre', 2407807, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mossoró', 2408003, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Natal', 2408102, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José De Mipibu', 2412203, estado_id FROM epidemiologia.estado WHERE sigla = 'RN' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alagoa Grande', 2500304, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belém', 2501906, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cabedelo', 2503209, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cajazeiras', 2503704, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campina Grande', 2504009, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Catolé Do Rocha', 2504306, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cuité', 2505105, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Diamante', 2505600, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'João Pessoa', 2507507, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Junco Do Seridó', 2507804, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nazarezinho', 2510006, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Patos', 2510808, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paulista', 2510907, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pombal', 2512101, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santana De Mangueira', 2513505, estado_id FROM epidemiologia.estado WHERE sigla = 'PB' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Águas Belas', 2600500, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araripina', 2601102, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Arcoverde', 2601201, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bezerros', 2601904, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bodocó', 2602001, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bonito', 2602308, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cabo De Santo Agostinho', 2602902, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cabrobó', 2603009, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Camaragibe', 2603454, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Feira Nova', 2605400, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Igarassu', 2606804, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lagoa Grande', 2608750, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Machados', 2609105, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nazaré Da Mata', 2609501, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Olinda', 2609600, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Orocó', 2609808, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ouricuri', 2609907, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paudalho', 2610608, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Recife', 2611606, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Formoso', 2611903, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vicência', 2616308, estado_id FROM epidemiologia.estado WHERE sigla = 'PE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belém', 2700805, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belém', 2700805, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Delmiro Gouveia', 2702405, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Dois Riachos', 2702504, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Junqueiro', 2704005, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maceió', 2704302, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Largo', 2707701, estado_id FROM epidemiologia.estado WHERE sigla = 'AL' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aracaju', 2800308, estado_id FROM epidemiologia.estado WHERE sigla = 'SE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Boquim', 2800670, estado_id FROM epidemiologia.estado WHERE sigla = 'SE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Canindé De São Francisco', 2801207, estado_id FROM epidemiologia.estado WHERE sigla = 'SE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Japaratuba', 2803302, estado_id FROM epidemiologia.estado WHERE sigla = 'SE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nossa Senhora Da Glória', 2804508, estado_id FROM epidemiologia.estado WHERE sigla = 'SE' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alagoinhas', 2900702, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alcobaça', 2900801, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Banzaê', 2902658, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barreiras', 2903201, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brumado', 2904605, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cachoeira', 2904902, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Candiba', 2906600, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Capela Do Alto Alegre', 2906857, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Conceição Do Coité', 2908408, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Coração De Maria', 2908903, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Eunápolis', 2910727, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ilhéus', 2913606, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itabuna', 2914802, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jequié', 2918001, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juazeiro', 2918407, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lauro De Freitas', 2919207, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Luís Eduardo Magalhães', 2919553, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maragogipe', 2920601, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Milagres', 2921302, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmeiras', 2923506, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paulo Afonso', 2924009, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pojuca', 2925204, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Seguro', 2925303, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Salvador', 2927408, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Maria Da Vitória', 2928109, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Simões Filho', 2930709, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sobradinho', 2930774, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Teixeira De Freitas', 2931350, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ubaitaba', 2932200, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vitória Da Conquista', 2933307, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Wanderley', 2933455, estado_id FROM epidemiologia.estado WHERE sigla = 'BA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Abre Campo', 3100302, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alterosa', 3102001, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araguari', 3103504, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barão De Cocais', 3105400, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barbacena', 3105608, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belo Horizonte', 3106200, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Belo Oriente', 3106309, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Betim', 3106705, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bicas', 3106903, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bocaiúva', 3107307, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Despacho', 3107406, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caeté', 3110004, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cambuí', 3110608, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caputira', 3112901, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carlos Chagas', 3113701, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carmo Do Cajuru', 3114204, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Congonhas', 3118007, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Contagem', 3118601, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Coronel Fabriciano', 3119401, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Divinópolis', 3122306, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Felixlândia', 3125705, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Formiga', 3126109, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Formoso', 3126208, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Indianópolis', 3130705, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ipatinga', 3131307, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itabira', 3131703, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itabirito', 3131901, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itajubá', 3132404, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itamarandiba', 3132503, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaú De Minas', 3133758, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ituiutaba', 3134202, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Januária', 3135209, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jequitinhonha', 3135803, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Joanésia', 3136108, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova União', 3136603, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juiz De Fora', 3136702, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ladainha', 3137007, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lagoa Da Prata', 3137205, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mantena', 3139607, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mariana', 3140001, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Matozinhos', 3141108, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Montes Claros', 3143302, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Lima', 3144805, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Oliveira', 3145604, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paracatu', 3147006, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pará De Minas', 3147105, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Patos De Minas', 3148004, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Piumhi', 3151503, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Poços De Caldas', 3151800, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porteirinha', 3152204, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Bárbara', 3157203, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Vitória', 3159803, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santos Dumont', 3160702, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João Del Rei', 3162500, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Lourenço', 3163706, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sarzedo', 3165537, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Senador Firmino', 3165701, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Serra Azul De Minas', 3166501, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Simonésia', 3167608, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Timóteo', 3168705, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Três Marias', 3169356, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Uberaba', 3170107, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Uberlândia', 3170206, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vargem Alegre', 3170578, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Varzelândia', 3170909, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Viçosa', 3171303, estado_id FROM epidemiologia.estado WHERE sigla = 'MG' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colatina', 3201506, estado_id FROM epidemiologia.estado WHERE sigla = 'ES' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Serra', 3205002, estado_id FROM epidemiologia.estado WHERE sigla = 'ES' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vila Velha', 3205200, estado_id FROM epidemiologia.estado WHERE sigla = 'ES' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vitória', 3205309, estado_id FROM epidemiologia.estado WHERE sigla = 'ES' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Angra Dos Reis', 3300100, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jardim', 3300506, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cabo Frio', 3300704, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cachoeiras De Macacu', 3300803, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campos Dos Goytacazes', 3301009, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Duque De Caxias', 3301702, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Iguaba Grande', 3301876, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaguaí', 3302007, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Italva', 3302056, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Japeri', 3302270, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Macaé', 3302403, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maricá', 3302700, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nilópolis', 3303203, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Niterói', 3303302, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Friburgo', 3303401, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Iguaçu', 3303500, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paty Do Alferes', 3303856, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Petrópolis', 3303906, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Queimados', 3304144, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio De Janeiro', 3304557, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Gonçalo', 3304904, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João De Meriti', 3305109, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Pedro Da Aldeia', 3305208, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sapucaia', 3305406, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Saquarema', 3305505, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Seropédica', 3305554, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Teresópolis', 3305802, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Volta Redonda', 3306305, estado_id FROM epidemiologia.estado WHERE sigla = 'RJ' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Americana', 3501608, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araçatuba', 3502804, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araras', 3503307, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Arujá', 3503901, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Atibaia', 3504107, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Avaré', 3504503, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barueri', 3505708, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bauru', 3506003, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bragança Paulista', 3507605, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campinas', 3509502, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caraguatatuba', 3510500, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carapicuíba', 3510609, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cedral', 3511300, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cosmópolis', 3512803, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cotia', 3513009, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Diadema', 3513801, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fernandópolis', 3515509, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Guarujá', 3518701, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Guarulhos', 3518800, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Hortolândia', 3519071, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Icém', 3519808, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ilha Comprida', 3520426, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Indaiatuba', 3520509, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jacareí', 3524402, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jundiaí', 3525904, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lençóis Paulista', 3526803, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Limeira', 3526902, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Louveira', 3527306, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mairiporã', 3528502, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mogi Das Cruzes', 3530607, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mogi Guaçu', 3530706, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Monte Mor', 3531803, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Granada', 3533007, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Odessa', 3533403, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Onda Verde', 3534005, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Osasco', 3534401, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paulínia', 3536505, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Penápolis', 3537305, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pinhalzinho', 3538204, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Promissão', 3541604, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Registro', 3542602, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ribeirão Preto', 3543402, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Grande Da Serra', 3544103, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santo André', 3547809, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Bernardo Do Campo', 3548708, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José Do Rio Preto', 3549805, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José Dos Campos', 3549904, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Luiz Do Paraitinga', 3550001, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Paulo', 3550308, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Roque', 3550605, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Vicente', 3551009, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sertãozinho', 3551702, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sumaré', 3552403, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Taquarituba', 3553807, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tietê', 3554508, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Urânia', 3555802, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Várzea Paulista', 3556503, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Votuporanga', 3557105, estado_id FROM epidemiologia.estado WHERE sigla = 'SP' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Almirante Tamandaré', 4100400, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ampére', 4101002, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Apucarana', 4101408, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campina Da Lagoa', 4103909, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Largo', 4104204, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Mourão', 4104303, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Capanema', 4104501, estado_id FROM epidemiologia.estado WHERE sigla = 'PA' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cascavel', 4104808, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Catanduvas', 4105003, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colombo', 4105805, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curitiba', 4106902, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curiúva', 4107009, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Farol', 4107553, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Fazenda Rio Grande', 4107652, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Foz Do Iguaçu', 4108304, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ivaiporã', 4111506, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jaguariaíva', 4112009, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juranda', 4112959, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Londrina', 4113700, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marechal Cândido Rondon', 4114609, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maringá', 4115200, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Medianeira', 4115804, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paranaguá', 4118204, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pato Branco', 4118501, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pinhais', 4119152, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ponta Grossa', 4119905, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pontal Do Paraná', 4119954, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Quarto Centenário', 4120655, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Realeza', 4121406, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rondon', 4122602, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São João Do Ivaí', 4125001, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José Dos Pinhais', 4125506, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Telêmaco Borba', 4127106, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Terra Boa', 4127205, estado_id FROM epidemiologia.estado WHERE sigla = 'PR' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alfredo Wagner', 4200705, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Apiúna', 4201257, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araquari', 4201307, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Araranguá', 4201406, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Balneário Camboriú', 4202008, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Biguaçu', 4202305, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Blumenau', 4202404, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Braço Do Norte', 4202800, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brusque', 4202909, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caçador', 4203006, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campos Novos', 4203600, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Chapecó', 4204202, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Concórdia', 4204301, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Criciúma', 4204608, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Curitibanos', 4204806, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Florianópolis', 4205407, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gaspar', 4205902, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Içara', 4207007, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ilhota', 4207106, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Indaial', 4207502, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itajaí', 4208203, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itapema', 4208302, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ituporanga', 4208500, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jaraguá Do Sul', 4208906, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Joinville', 4209102, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lages', 4209300, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Laurentino', 4209508, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mafra', 4210100, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Maravilha', 4210506, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Navegantes', 4211306, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Trento', 4211504, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palhoça', 4211900, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Passo De Torres', 4212254, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Penha', 4212502, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Balneário Piçarras', 4212809, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Presidente Getúlio', 4214003, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Do Sul', 4214805, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Fortuna', 4214904, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Negrinho', 4215000, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santo Amaro Da Imperatriz', 4215703, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Bento Do Sul', 4215802, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Francisco Do Sul', 4216206, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José', 4216602, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Siderópolis', 4217600, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tijucas', 4218004, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Timbó', 4218202, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tubarão', 4218707, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Videira', 4219309, estado_id FROM epidemiologia.estado WHERE sigla = 'SC' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Arroio Grande', 4301305, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bento Gonçalves', 4302105, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caiçara', 4303400, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Capão Da Canoa', 4304630, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caxias Do Sul', 4305108, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Charrua', 4305371, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cruz Alta', 4306106, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Encantado', 4306809, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gravataí', 4309209, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marau', 4311809, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mato Castelhano', 4312138, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Montenegro', 4312401, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nonoai', 4312708, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Bassano', 4312906, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Passo Fundo', 4314100, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porto Alegre', 4314902, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Grande', 4315602, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José Do Ouro', 4318606, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Sebastião Do Caí', 4319505, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sapucaia Do Sul', 4320008, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Severiano De Almeida', 4320602, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Tapejara', 4320909, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Uruguaiana', 4322400, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vale Real', 4322541, estado_id FROM epidemiologia.estado WHERE sigla = 'RS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Água Clara', 5000203, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Amambai', 5000609, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Grande', 5002704, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Chapadão Do Sul', 5002951, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Corumbá', 5003207, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Costa Rica', 5003256, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Dourados', 5003702, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Inocência', 5004403, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Naviraí', 5005707, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paranaíba', 5006309, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ponta Porã', 5006606, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ribas Do Rio Pardo', 5007109, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Brilhante', 5007208, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Três Lagoas', 5008305, estado_id FROM epidemiologia.estado WHERE sigla = 'MS' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alta Floresta', 5100250, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Apiacás', 5100805, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aripuanã', 5101407, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Barra Do Garças', 5101803, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brasnorte', 5101902, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cáceres', 5102504, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Novo Do Parecis', 5102637, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Verde', 5102678, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carlinda', 5102793, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cocalinho', 5103106, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Colíder', 5103205, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Confresa', 5103353, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Conquista D''Oeste', 5103361, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cuiabá', 5103403, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Diamantino', 5103502, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Guarantã Do Norte', 5104104, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jaciara', 5104807, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juara', 5105101, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Juscimeira', 5105200, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Lucas Do Rio Verde', 5105259, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Marcelândia', 5105580, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Matupá', 5105606, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Santa Helena', 5106190, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Mutum', 5106224, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Paranatinga', 5106307, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Peixoto De Azevedo', 5106422, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Pontes E Lacerda', 5106752, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Primavera Do Leste', 5107040, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Querência', 5107065, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São José Do Rio Claro', 5107305, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Cruz Do Xingu', 5107743, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Terezinha', 5107776, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Félix Do Araguaia', 5107859, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sapezal', 5107875, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sinop', 5107909, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Sorriso', 5107925, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Terra Nova Do Norte', 5108055, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vera', 5108501, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vila Rica', 5108600, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Guarita', 5108808, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Monte Verde', 5108956, estado_id FROM epidemiologia.estado WHERE sigla = 'MT' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Abadia De Goiás', 5200050, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Abadiânia', 5200100, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Alto Horizonte', 5200555, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Anápolis', 5201108, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aparecida De Goiânia', 5201405, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Aragoiânia', 5201801, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Bom Jesus De Goiás', 5203500, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cachoeira Alta', 5204102, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caiapônia', 5204409, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Caldas Novas', 5204508, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campo Limpo De Goiás', 5204854, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Campos Verdes', 5204953, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Carmo Do Rio Verde', 5205000, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Catalão', 5205109, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Ceres', 5205406, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Chapadão Do Céu', 5205471, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Corumbaíba', 5205901, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Cromínia', 5206503, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Goianésia', 5208608, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Goiânia', 5208707, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Goiatuba', 5209101, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Gouvelândia', 5209150, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Guapó', 5209200, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Guarani De Goiás', 5209408, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Hidrolândia', 5209705, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Inhumas', 5210000, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Iporá', 5210208, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itaberaí', 5210406, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itapaci', 5210901, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Itumbiara', 5211503, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jaraguá', 5211800, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Jataí', 5211909, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Leopoldo De Bulhões', 5212303, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Luziânia', 5212501, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Minaçu', 5213087, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Mozarlândia', 5214002, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nerópolis', 5214507, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Niquelândia', 5214606, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Nova Crixás', 5214838, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Novo Gama', 5215231, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Padre Bernardo', 5215603, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palmelo', 5215801, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Palminópolis', 5215900, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Petrolina De Goiás', 5216809, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Porangatu', 5218003, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Rio Verde', 5218805, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Santa Helena De Goiás', 5219308, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Luís De Montes Belos', 5220108, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'São Miguel Do Araguaia', 5220207, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Senador Canedo', 5220454, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Terezópolis De Goiás', 5221197, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Trindade', 5221403, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Uruaçu', 5221601, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Valparaíso De Goiás', 5221858, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Vila Boa', 5222203, estado_id FROM epidemiologia.estado WHERE sigla = 'GO' 
ON CONFLICT DO NOTHING;
INSERT INTO epidemiologia.municipio (nome, codigo_ibge, estado_id) 
SELECT 'Brasília', 5300108, estado_id FROM epidemiologia.estado WHERE sigla = 'DF' 
ON CONFLICT DO NOTHING;

-- Popular a dimensão origem com valores únicos do staging
INSERT INTO epidemiologia.origem (nome)
SELECT DISTINCT LOWER(origem)
FROM epidemiologia.staging_dados 
WHERE origem IS NOT NULL AND origem != ''
ON CONFLICT DO NOTHING;

-- Verificar quantos registros foram inseridos
SELECT COUNT(*) as total_origens FROM epidemiologia.origem;

-- Ver os valores inseridos
SELECT * FROM epidemiologia.origem ORDER BY nome;

-- Popular a dimensão sintomas com valores únicos do staging
INSERT INTO epidemiologia.sintoma (descricao)
SELECT DISTINCT LOWER(sintomas)
FROM epidemiologia.staging_dados 
WHERE sintomas IS NOT NULL AND sintomas != ''
ON CONFLICT DO NOTHING;

-- Popular laboratório com valores de AMBAS as doses
INSERT INTO epidemiologia.laboratorio (nome)
SELECT DISTINCT LOWER(codigolaboratorioprimeiradose)
FROM epidemiologia.staging_dados 
WHERE codigolaboratorioprimeiradose IS NOT NULL AND codigolaboratorioprimeiradose != ''
UNION
SELECT DISTINCT LOWER(codigolaboratoriosegundadose)
FROM epidemiologia.staging_dados 
WHERE codigolaboratoriosegundadose IS NOT NULL AND codigolaboratoriosegundadose != ''
ON CONFLICT DO NOTHING;

-- Verificar
SELECT COUNT(*) as total_laboratorios FROM epidemiologia.laboratorio;
SELECT * FROM epidemiologia.laboratorio ORDER BY nome;

-- Popular lote com valores de AMBAS as doses
INSERT INTO epidemiologia.lote (codigo)  -- <<<< CORRIGIDO: lote
SELECT DISTINCT LOWER(loteprimeiradose)
FROM epidemiologia.staging_dados 
WHERE loteprimeiradose IS NOT NULL AND loteprimeiradose != ''
UNION
SELECT DISTINCT LOWER(lotesegundadose)
FROM epidemiologia.staging_dados 
WHERE lotesegundadose IS NOT NULL AND lotesegundadose != ''
ON CONFLICT DO NOTHING;

-- Verificar
SELECT COUNT(*) as total_lotes FROM epidemiologia.lote;  -- <<<< CORRIGIDO
SELECT * FROM epidemiologia.lote ORDER BY codigo LIMIT 20;  -- <<<< CORRIGIDO