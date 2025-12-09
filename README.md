# Projeto de Banco de Dados - COVID-19 Pará

Análise de dados epidemiológicos de COVID-19 do estado do Pará utilizando PostgreSQL e Python.

## 📊 Sobre o Projeto

Este projeto realiza o tratamento, armazenamento e análise de dados de notificações de COVID-19 no estado do Pará. Inclui pipeline completo de ETL, modelagem dimensional e dashboard interativo.

**Dataset**: 148.741 registros de notificações de COVID-19  
**Período**: Dados epidemiológicos do estado do Pará  
**Tecnologias**: Python (Pandas), PostgreSQL, Streamlit

## 🚀 Caminho de Execução

Execute os arquivos **na ordem exata** apresentada abaixo:

### 1. **tratamento.ipynb**
Notebook Jupyter com limpeza e transformação dos dados brutos.
- Carrega `dataseet-isaac.csv`
- Realiza limpeza, normalização e mapeamento de valores
- Gera `dataset_limpo.csv` e `staging_data_fixed.csv`

### 2. **criar_banco.txt**
Script DDL para criação do schema e estrutura do banco de dados.
- Cria schema `epidemiologia`
- Define tabelas dimensionais e fato
- Estabelece chaves primárias e estrangeiras

### 3. **staging_dados.sql**
Cria tabela de staging e carrega dados intermediários.
- Define estrutura da tabela `staging_dados`
- Prepara ambiente para carga dos dados limpos

### 4. **inserts_dimensoes.sql**
Popula todas as tabelas dimensionais.
- Insere dados nas dimensões: sexo, raça, evolução, classificação
- Carrega estados (27) e municípios (826)
- Popula laboratórios e outras dimensões de apoio

### 5. **inserts_fato.sql**
Carrega a tabela fato principal com os dados das notificações.
- Insere 148.741 registros na tabela `notificacao`
- Realiza joins com dimensões para obter as chaves corretas

### 6. **verificacoes.sql**
Queries de validação e qualidade dos dados.
- Verifica registros NULL nas dimensões
- Analisa distribuições estatísticas
- Gera relatórios de consistência

### 7. **criar_tabela_log.sql**
Cria infraestrutura de auditoria e logs.
- Define tabela de log de operações
- Prepara estrutura para rastreamento de mudanças

### 8. Arquivos Complementares (ordem flexível)

- **criar_function.sql**: Functions PostgreSQL para automações
- **criar_triggers.sql**: Triggers para auditoria automática
- **criar_views.sql**: Views materializadas para consultas otimizadas
- **app.py**: Dashboard Streamlit com 7 seções de visualização

## 📁 Estrutura de Arquivos

```
trabalho-banco-de-dados/
├── dataseet-isaac.csv          # Dataset original (148.741 registros)
├── dataset_limpo.csv            # Dataset após limpeza
├── staging_data_fixed.csv       # Dados formatados para staging
├── tratamento.ipynb             # [1] Notebook de limpeza
├── criar_banco.txt              # [2] DDL do banco
├── staging_dados.sql            # [3] Criação staging
├── inserts_dimensoes.sql        # [4] Carga dimensões
├── inserts_fato.sql             # [5] Carga fato
├── verificacoes.sql             # [6] Validações
├── criar_tabela_log.sql         # [7] Infraestrutura log
├── criar_function.sql           # Functions
├── criar_triggers.sql           # Triggers
├── criar_views.sql              # Views
└── app.py                       # Dashboard Streamlit
```

## 🎯 Modelo de Dados

### Tabela Fato
- `notificacao`: 148.741 registros com informações completas das notificações

### Dimensões Principais
- **Geográficas**: `estado` (27), `municipio` (826)
- **Demográficas**: `sexo`, `raca`, `faixa_etaria`
- **Clínicas**: `evolucao`, `classificacao`, `sintoma`
- **Vacinação**: `laboratorio`, doses e lotes

## 🛠️ Requisitos

- PostgreSQL 12+
- Python 3.8+
- Bibliotecas Python: pandas, streamlit, plotly, folium

## ▶️ Executando o Dashboard

Após executar os scripts 1-7, rode o dashboard:

```bash
streamlit run app.py
```

Dashboard disponível em: http://localhost:8501

### Seções do Dashboard:
1. **Visão Geral**: Métricas principais e KPIs
2. **Análise Temporal**: Evolução de casos ao longo do tempo
3. **Demografia**: Distribuição por sexo, raça e faixa etária
4. **Vacinação**: Status vacinal e análise de doses
5. **Testes**: Resultados laboratoriais
6. **Mapa de Calor**: Visualização geográfica dos casos
7. **Análise Preditiva**: Padrões e tendências

## 📈 Estatísticas do Dataset

- **Total de notificações**: 148.741
- **Municípios**: 142 únicos
- **Top 3 municípios**: Belém (22.190), Tucuruí (14.225), Barcarena (7.340)
- **Taxa de vacinação**: 65,2% (96.988 vacinados)
- **Profissionais de saúde**: 3.357 (2,3%)
- **Resultados de testes**: 71,6% negativos, 14,4% positivos

## 👥 Autores

Projeto desenvolvido para a disciplina de Banco de Dados.

---

**Nota**: Respeite a ordem de execução dos scripts 1-7 para garantir a integridade referencial do banco de dados.
