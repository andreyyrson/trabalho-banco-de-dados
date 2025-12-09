import streamlit as st
import pandas as pd
import numpy as np
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import folium
from streamlit_folium import folium_static
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import classification_report, confusion_matrix, roc_curve, auc, accuracy_score, precision_score, recall_score, f1_score
import seaborn as sns
import matplotlib.pyplot as plt
from datetime import datetime
import warnings
warnings.filterwarnings('ignore')

# Configuração da página
st.set_page_config(
    page_title="Análise COVID-19 - Pará",
    page_icon="🦠",
    layout="wide",
    initial_sidebar_state="expanded"
)

# CSS personalizado
st.markdown("""
    <style>
    .main {
        padding: 0rem 1rem;
    }
    .stMetric {
        background-color: #f0f2f6;
        padding: 10px;
        border-radius: 5px;
    }
    </style>
""", unsafe_allow_html=True)

# Cache para carregar dados
@st.cache_data
def load_data():
    """Carrega e prepara os dados"""
    try:
        # Tentar diferentes delimitadores e encodings
        for sep in [';', ',', '|']:
            for encoding in ['utf-8-sig', 'utf-8', 'latin-1']:
                try:
                    df = pd.read_csv('dataset_limpo.csv', 
                                    sep=sep, 
                                    encoding=encoding, 
                                    low_memory=False)
                    
                    # Se conseguiu carregar com mais de 1 coluna, encontrou o delimitador correto
                    if len(df.columns) > 1:
                        
                        # Conversão de datas
                        date_columns = ['datanotificacao', 'datainiciosintomas', 'datacoletateste1', 
                                       'dataencerramento', 'dataprimeiradose', 'datasegundadose']
                        for col in date_columns:
                            if col in df.columns:
                                df[col] = pd.to_datetime(df[col], errors='coerce')
                        
                        return df
                except:
                    continue
        
        st.error("Não foi possível carregar o arquivo com os delimitadores testados.")
        return None
        
    except Exception as e:
        st.error(f"Erro ao carregar dados: {e}")
        return None

def preparar_dados_modelo(df):
    """Prepara dados para modelagem preditiva"""
    # Selecionar colunas relevantes
    colunas_modelo = []
    
    # Verificar quais colunas existem
    colunas_possiveis = ['idade', 'sexo', 'racacor', 'codigoestadoteste1', 'codigorecebeuvacina',
                         'profissionalsaude', 'profissionalseguranca', 'municipionotificacao']
    
    colunas_modelo = [col for col in colunas_possiveis if col in df.columns]
    
    # Criar DataFrame para modelo
    if 'codigoresultadoteste1' in df.columns:
        df_modelo = df[colunas_modelo + ['codigoresultadoteste1']].copy()
        df_modelo = df_modelo.dropna(subset=['codigoresultadoteste1'])
        return df_modelo
    
    return pd.DataFrame()

# Título principal
st.title("🦠 Análise Epidemiológica COVID-19 - Estado do Pará")
st.markdown("---")

# Carregar dados
with st.spinner("Carregando dados..."):
    df = load_data()

if df is None:
    st.stop()

# Sidebar com filtros
st.sidebar.header("📊 Filtros")

# Filtro de data
if 'datanotificacao' in df.columns:
    data_min = df['datanotificacao'].min()
    data_max = df['datanotificacao'].max()
    
    if pd.notna(data_min) and pd.notna(data_max):
        date_range = st.sidebar.date_input(
            "Período",
            value=(data_min, data_max),
            min_value=data_min,
            max_value=data_max
        )
        
        if len(date_range) == 2:
            mask = (df['datanotificacao'] >= pd.Timestamp(date_range[0])) & \
                   (df['datanotificacao'] <= pd.Timestamp(date_range[1]))
            df_filtered = df[mask].copy()
        else:
            df_filtered = df.copy()
    else:
        df_filtered = df.copy()
else:
    df_filtered = df.copy()

# Filtro de município
if 'municipionotificacao' in df_filtered.columns:
    municipios = ['Todos'] + sorted(df_filtered['municipionotificacao'].dropna().unique().tolist())
    municipio_selecionado = st.sidebar.selectbox("Município", municipios)
    
    if municipio_selecionado != 'Todos':
        df_filtered = df_filtered[df_filtered['municipionotificacao'] == municipio_selecionado]

# Seção de navegação
st.sidebar.markdown("---")
st.sidebar.header("📑 Navegação")
secao = st.sidebar.radio(
    "Selecione a análise:",
    ["📈 Visão Geral",
     "⏱️ Evolução Temporal",
     "👥 Perfil Demográfico",
     "💉 Análise de Vacinação",
     "🧪 Testes Laboratoriais",
     "🗺️ Mapa de Calor"]
)

# ============================================================================
# SEÇÃO 1: VISÃO GERAL
# ============================================================================
if secao == "📈 Visão Geral":
    st.header("📈 Visão Geral dos Dados")
    
    # KPIs principais
    col1, col2, col3, col4 = st.columns(4)
    
    with col1:
        total_casos = len(df_filtered)
        st.metric("Total de Notificações", f"{total_casos:,}")
    
    with col2:
        if 'classificacaofinal' in df_filtered.columns:
            confirmados = len(df_filtered[df_filtered['classificacaofinal'].notna()])
            st.metric("Casos Classificados", f"{confirmados:,}")
    
    with col3:
        if 'evolucaocaso' in df_filtered.columns:
            obitos = len(df_filtered[df_filtered['evolucaocaso'].str.contains('Óbito', case=False, na=False)])
            st.metric("Óbitos", f"{obitos:,}")
    
    with col4:
        if 'municipionotificacao' in df_filtered.columns:
            municipios_afetados = df_filtered['municipionotificacao'].nunique()
            st.metric("Municípios Afetados", f"{municipios_afetados:,}")
    
    st.markdown("---")
    
    # Gráficos de visão geral
    col1, col2 = st.columns(2)
    
    with col1:
        if 'classificacaofinal' in df_filtered.columns:
            st.subheader("Distribuição por Classificação Final")
            classif_counts = df_filtered['classificacaofinal'].value_counts().head(10)
            fig = px.pie(
                values=classif_counts.values,
                names=classif_counts.index,
                title="Casos por Classificação",
                color_discrete_sequence=px.colors.qualitative.Set3
            )
            st.plotly_chart(fig, use_container_width=True)
    
    with col2:
        if 'evolucaocaso' in df_filtered.columns:
            st.subheader("Distribuição por Evolução do Caso")
            evolucao_counts = df_filtered['evolucaocaso'].value_counts()
            fig = px.bar(
                x=evolucao_counts.index,
                y=evolucao_counts.values,
                title="Evolução dos Casos",
                labels={'x': 'Evolução', 'y': 'Quantidade'},
                color=evolucao_counts.values,
                color_continuous_scale='Reds'
            )
            st.plotly_chart(fig, use_container_width=True)
    
    # Painel de indicadores regionais
    st.markdown("---")
    st.subheader("📊 Indicadores por Município (Top 10)")
    
    if 'municipionotificacao' in df_filtered.columns:
        top_municipios = df_filtered['municipionotificacao'].value_counts().head(10)
        
        fig = go.Figure()
        fig.add_trace(go.Bar(
            x=top_municipios.values,
            y=top_municipios.index,
            orientation='h',
            marker=dict(
                color=top_municipios.values,
                colorscale='Viridis',
                showscale=True
            ),
            text=top_municipios.values,
            textposition='outside'
        ))
        
        fig.update_layout(
            title="Notificações por Município",
            xaxis_title="Número de Notificações",
            yaxis_title="Município",
            height=500
        )
        
        st.plotly_chart(fig, use_container_width=True)

# ============================================================================
# SEÇÃO 2: EVOLUÇÃO TEMPORAL
# ============================================================================
elif secao == "⏱️ Evolução Temporal":
    st.header("⏱️ Evolução Temporal dos Casos")
    
    if 'datanotificacao' in df_filtered.columns:
        # Preparar dados temporais
        df_temp = df_filtered[df_filtered['datanotificacao'].notna()].copy()
        df_temp['ano_mes'] = df_temp['datanotificacao'].dt.to_period('M')
        df_temp['data'] = df_temp['datanotificacao'].dt.date
        
        # Série temporal geral
        st.subheader("📈 Série Temporal de Notificações")
        
        # Escolha de agregação
        agregacao = st.radio("Agregação:", ["Diária", "Semanal", "Mensal"], horizontal=True)
        
        if agregacao == "Diária":
            ts_data = df_temp.groupby('data').size().reset_index(name='casos')
        elif agregacao == "Semanal":
            df_temp['semana'] = df_temp['datanotificacao'].dt.to_period('W')
            ts_data = df_temp.groupby('semana').size().reset_index(name='casos')
            ts_data['data'] = ts_data['semana'].dt.start_time
        else:
            ts_data = df_temp.groupby('ano_mes').size().reset_index(name='casos')
            ts_data['data'] = ts_data['ano_mes'].dt.start_time
        
        fig = go.Figure()
        fig.add_trace(go.Scatter(
            x=ts_data['data'],
            y=ts_data['casos'],
            mode='lines+markers',
            name='Casos',
            line=dict(color='#1f77b4', width=2),
            fill='tozeroy',
            fillcolor='rgba(31, 119, 180, 0.2)'
        ))
        
        fig.update_layout(
            title=f"Evolução {agregacao} dos Casos",
            xaxis_title="Data",
            yaxis_title="Número de Casos",
            hovermode='x unified',
            height=400
        )
        
        st.plotly_chart(fig, use_container_width=True)
        
        # Evolução por classificação
        st.markdown("---")
        st.subheader("📊 Evolução por Classificação")
        
        if 'classificacaofinal' in df_temp.columns:
            df_classif = df_temp[df_temp['classificacaofinal'].notna()].copy()
            
            if agregacao == "Mensal":
                ts_classif = df_classif.groupby(['ano_mes', 'classificacaofinal']).size().reset_index(name='casos')
                ts_classif['data'] = ts_classif['ano_mes'].dt.start_time
            else:
                ts_classif = df_classif.groupby(['data', 'classificacaofinal']).size().reset_index(name='casos')
            
            # Mostrar apenas as top 5 classificações
            top_classif = df_classif['classificacaofinal'].value_counts().head(5).index
            ts_classif_top = ts_classif[ts_classif['classificacaofinal'].isin(top_classif)]
            
            fig = px.line(
                ts_classif_top,
                x='data',
                y='casos',
                color='classificacaofinal',
                title="Evolução por Classificação (Top 5)",
                labels={'data': 'Data', 'casos': 'Número de Casos', 'classificacaofinal': 'Classificação'},
                color_discrete_sequence=px.colors.qualitative.Bold
            )
            
            fig.update_layout(height=400, hovermode='x unified')
            st.plotly_chart(fig, use_container_width=True)
        
        # Evolução por município (top 5)
        st.markdown("---")
        st.subheader("🏙️ Evolução por Município (Top 5)")
        
        if 'municipionotificacao' in df_temp.columns:
            top5_municipios = df_temp['municipionotificacao'].value_counts().head(5).index
            df_top5 = df_temp[df_temp['municipionotificacao'].isin(top5_municipios)]
            
            if agregacao == "Mensal":
                ts_mun = df_top5.groupby(['ano_mes', 'municipionotificacao']).size().reset_index(name='casos')
                ts_mun['data'] = ts_mun['ano_mes'].dt.start_time
            else:
                ts_mun = df_top5.groupby(['data', 'municipionotificacao']).size().reset_index(name='casos')
            
            fig = px.line(
                ts_mun,
                x='data',
                y='casos',
                color='municipionotificacao',
                title="Evolução dos 5 Municípios com Mais Casos",
                labels={'data': 'Data', 'casos': 'Número de Casos', 'municipionotificacao': 'Município'}
            )
            
            fig.update_layout(height=450, hovermode='x unified')
            st.plotly_chart(fig, use_container_width=True)
        
        # Mapa de calor - sazonalidade
        st.markdown("---")
        st.subheader("🔥 Mapa de Calor - Padrões Temporais")
        
        df_temp['dia_semana'] = df_temp['datanotificacao'].dt.day_name()
        df_temp['mes'] = df_temp['datanotificacao'].dt.month_name()
        
        col1, col2 = st.columns(2)
        
        with col1:
            # Heatmap por dia da semana e mês
            heatmap_data = df_temp.groupby(['mes', 'dia_semana']).size().reset_index(name='casos')
            heatmap_pivot = heatmap_data.pivot(index='dia_semana', columns='mes', values='casos')
            
            # Ordenar dias da semana
            dias_ordem = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
            heatmap_pivot = heatmap_pivot.reindex([d for d in dias_ordem if d in heatmap_pivot.index])
            
            fig = px.imshow(
                heatmap_pivot,
                labels=dict(x="Mês", y="Dia da Semana", color="Casos"),
                title="Casos por Dia da Semana e Mês",
                color_continuous_scale="YlOrRd",
                aspect="auto"
            )
            st.plotly_chart(fig, use_container_width=True)
        
        with col2:
            # Casos por mês
            casos_mes = df_temp['mes'].value_counts()
            fig = px.bar(
                x=casos_mes.index,
                y=casos_mes.values,
                title="Distribuição por Mês",
                labels={'x': 'Mês', 'y': 'Casos'},
                color=casos_mes.values,
                color_continuous_scale='Blues'
            )
            st.plotly_chart(fig, use_container_width=True)
    else:
        st.warning("⚠️ Coluna de data de notificação não encontrada no dataset.")

# ============================================================================
# SEÇÃO 3: PERFIL DEMOGRÁFICO
# ============================================================================
elif secao == "👥 Perfil Demográfico":
    st.header("👥 Perfil Demográfico dos Casos")
    
    # Distribuição por sexo
    col1, col2 = st.columns(2)
    
    with col1:
        if 'sexo' in df_filtered.columns:
            st.subheader("Distribuição por Sexo")
            sexo_counts = df_filtered['sexo'].value_counts()
            
            fig = go.Figure(data=[go.Pie(
                labels=sexo_counts.index,
                values=sexo_counts.values,
                hole=0.4,
                marker=dict(colors=['#FF6B6B', '#4ECDC4', '#95E1D3'])
            )])
            
            fig.update_layout(
                title="Casos por Sexo",
                annotations=[dict(text='Sexo', x=0.5, y=0.5, font_size=20, showarrow=False)]
            )
            
            st.plotly_chart(fig, use_container_width=True)
    
    with col2:
        if 'racacor' in df_filtered.columns:
            st.subheader("Distribuição por Raça/Cor")
            raca_counts = df_filtered['racacor'].value_counts().head(10)
            
            fig = px.bar(
                x=raca_counts.values,
                y=raca_counts.index,
                orientation='h',
                title="Casos por Raça/Cor",
                labels={'x': 'Quantidade', 'y': 'Raça/Cor'},
                color=raca_counts.values,
                color_continuous_scale='Teal'
            )
            
            st.plotly_chart(fig, use_container_width=True)
    
    # Faixa etária
    st.markdown("---")
    st.subheader("📊 Distribuição por Faixa Etária")
    
    if 'idade' in df_filtered.columns:
        df_idade = df_filtered[df_filtered['idade'].notna()].copy()
        df_idade = df_idade[df_idade['idade'] < 120]  # Filtrar idades inválidas
        
        df_idade['faixa_etaria'] = pd.cut(
            df_idade['idade'],
            bins=[0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 120],
            labels=['0-10', '11-20', '21-30', '31-40', '41-50', '51-60', 
                   '61-70', '71-80', '81-90', '90+']
        )
        
        faixa_counts = df_idade['faixa_etaria'].value_counts().sort_index()
        
        col1, col2 = st.columns([2, 1])
        
        with col1:
            fig = go.Figure()
            fig.add_trace(go.Bar(
                x=faixa_counts.index.astype(str),
                y=faixa_counts.values,
                marker=dict(
                    color=faixa_counts.values,
                    colorscale='Viridis',
                    showscale=True,
                    colorbar=dict(title="Casos")
                ),
                text=faixa_counts.values,
                textposition='outside'
            ))
            
            fig.update_layout(
                title="Casos por Faixa Etária",
                xaxis_title="Faixa Etária",
                yaxis_title="Número de Casos",
                height=400
            )
            
            st.plotly_chart(fig, use_container_width=True)
        
        with col2:
            st.metric("Idade Média", f"{df_idade['idade'].mean():.1f} anos")
            st.metric("Idade Mediana", f"{df_idade['idade'].median():.1f} anos")
            st.metric("Idade Mínima", f"{df_idade['idade'].min():.0f} anos")
            st.metric("Idade Máxima", f"{df_idade['idade'].max():.0f} anos")
    
    # Análise cruzada: Sexo x Faixa Etária
    st.markdown("---")
    st.subheader("🔄 Análise Cruzada: Sexo x Faixa Etária")
    
    if 'idade' in df_filtered.columns and 'sexo' in df_filtered.columns:
        df_cross = df_filtered[(df_filtered['idade'].notna()) & (df_filtered['sexo'].notna())].copy()
        df_cross = df_cross[df_cross['idade'] < 120]
        
        df_cross['faixa_etaria'] = pd.cut(
            df_cross['idade'],
            bins=[0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 120],
            labels=['0-10', '11-20', '21-30', '31-40', '41-50', '51-60', 
                   '61-70', '71-80', '81-90', '90+']
        )
        
        cross_tab = pd.crosstab(df_cross['faixa_etaria'], df_cross['sexo'])
        
        fig = go.Figure()
        
        for col in cross_tab.columns:
            fig.add_trace(go.Bar(
                name=col,
                x=cross_tab.index.astype(str),
                y=cross_tab[col],
                text=cross_tab[col],
                textposition='auto'
            ))
        
        fig.update_layout(
            title="Distribuição de Casos por Sexo e Faixa Etária",
            xaxis_title="Faixa Etária",
            yaxis_title="Número de Casos",
            barmode='group',
            height=400
        )
        
        st.plotly_chart(fig, use_container_width=True)
    
    # Profissionais de saúde e segurança
    st.markdown("---")
    st.subheader("💼 Profissionais de Saúde e Segurança")
    
    col1, col2 = st.columns(2)
    
    with col1:
        if 'profissionalsaude' in df_filtered.columns:
            prof_saude = df_filtered['profissionalsaude'].value_counts()
            # Contar 'sim' em minúscula (dados já normalizados)
            total_saude = prof_saude.get('sim', 0)
            st.metric("Profissionais de Saúde", f"{total_saude:,}")
            
            # Mostrar distribuição
            st.text(f"Sim: {prof_saude.get('sim', 0):,}")
            st.text(f"Não: {prof_saude.get('não', 0):,}")
    
    with col2:
        if 'profissionalseguranca' in df_filtered.columns:
            prof_seg = df_filtered['profissionalseguranca'].value_counts()
            # Contar 'sim' em minúscula (dados já normalizados)
            total_seg = prof_seg.get('sim', 0)
            st.metric("Profissionais de Segurança", f"{total_seg:,}")
            
            # Mostrar distribuição
            st.text(f"Sim: {prof_seg.get('sim', 0):,}")
            st.text(f"Não: {prof_seg.get('não', 0):,}")
    

# ============================================================================
# SEÇÃO 4: ANÁLISE DE VACINAÇÃO
# ============================================================================
elif secao == "💉 Análise de Vacinação":
    st.header("💉 Análise de Vacinação")
    
    if 'codigorecebeuvacina' in df_filtered.columns:
        # KPIs de vacinação
        col1, col2, col3, col4 = st.columns(4)
        
        vacina_counts = df_filtered['codigorecebeuvacina'].value_counts()
        total_com_info = len(df_filtered[df_filtered['codigorecebeuvacina'].notna()])
        
        with col1:
            vacinados = vacina_counts.get('sim', 0)
            st.metric("Vacinados", f"{vacinados:,}")
        
        with col2:
            nao_vacinados = vacina_counts.get('nao', 0)
            st.metric("Não Vacinados", f"{nao_vacinados:,}")
        
        with col3:
            nao_se_aplica = vacina_counts.get('nao_se_aplica', 0)
            st.metric("Não se Aplica", f"{nao_se_aplica:,}")
        
        with col4:
            if total_com_info > 0:
                taxa_vacinacao = (vacinados / total_com_info) * 100
                st.metric("Taxa de Vacinação", f"{taxa_vacinacao:.1f}%")
        
        st.markdown("---")
        
        # Gráfico de vacinação
        labels_map = {
            'sim': 'Vacinado',
            'nao': 'Não Vacinado',
            'nao_se_aplica': 'Não se Aplica',
            'ignorado': 'Ignorado'
        }
        
        fig = px.pie(
            values=vacina_counts.values,
            names=[labels_map.get(str(x), str(x)) for x in vacina_counts.index],
            title="Distribuição de Status Vacinal",
            hole=0.4,
            color_discrete_sequence=px.colors.qualitative.Set3
        )
        
        st.plotly_chart(fig, use_container_width=True)
        
        # Vacinação por faixa etária
        st.markdown("---")
        st.subheader("📈 Vacinação por Faixa Etária")
        
        if 'idade' in df_filtered.columns:
            df_vac_idade = df_filtered[(df_filtered['codigorecebeuvacina'].notna()) & 
                                      (df_filtered['idade'].notna())].copy()
            df_vac_idade = df_vac_idade[df_vac_idade['idade'] < 120]
            
            df_vac_idade['faixa_etaria'] = pd.cut(
                df_vac_idade['idade'],
                bins=[0, 18, 30, 40, 50, 60, 70, 120],
                labels=['0-17', '18-29', '30-39', '40-49', '50-59', '60-69', '70+']
            )
            
            df_vac_idade['status_vacina'] = df_vac_idade['codigorecebeuvacina'].map({
                'sim': 'Vacinado',
                'nao': 'Não Vacinado',
                'nao_se_aplica': 'Não se Aplica',
                'ignorado': 'Ignorado'
            })
            
            cross_idade_vac = pd.crosstab(
                df_vac_idade['faixa_etaria'],
                df_vac_idade['status_vacina']
            )
            
            fig = go.Figure()
            
            for col in cross_idade_vac.columns:
                fig.add_trace(go.Bar(
                    name=col,
                    x=cross_idade_vac.index.astype(str),
                    y=cross_idade_vac[col]
                ))
            
            fig.update_layout(
                title="Status Vacinal por Faixa Etária",
                xaxis_title="Faixa Etária",
                yaxis_title="Número de Casos",
                barmode='stack',
                height=400
            )
            
            st.plotly_chart(fig, use_container_width=True)
        
        # Evolução temporal da vacinação
        st.markdown("---")
        st.subheader("⏱️ Evolução Temporal da Vacinação")
        
        if 'datanotificacao' in df_filtered.columns:
            df_vac_tempo = df_filtered[df_filtered['codigorecebeuvacina'].notna()].copy()
            df_vac_tempo['ano_mes'] = df_vac_tempo['datanotificacao'].dt.to_period('M')
            df_vac_tempo['status_vacina'] = df_vac_tempo['codigorecebeuvacina'].map({
                'sim': 'Vacinado',
                'nao': 'Não Vacinado',
                'nao_se_aplica': 'Não se Aplica',
                'ignorado': 'Ignorado'
            })
            
            vac_tempo = df_vac_tempo.groupby(['ano_mes', 'status_vacina']).size().reset_index(name='casos')
            vac_tempo['data'] = vac_tempo['ano_mes'].dt.start_time
            
            fig = px.area(
                vac_tempo,
                x='data',
                y='casos',
                color='status_vacina',
                title="Evolução de Casos por Status Vacinal",
                labels={'data': 'Data', 'casos': 'Número de Casos', 'status_vacina': 'Status Vacinal'}
            )
            
            st.plotly_chart(fig, use_container_width=True)
    else:
        st.warning("⚠️ Informações de vacinação não disponíveis no dataset.")

# ============================================================================
# SEÇÃO 5: TESTES LABORATORIAIS
# ============================================================================
elif secao == "🧪 Testes Laboratoriais":
    st.header("🧪 Análise de Testes Laboratoriais")
    
    # Tipos de teste
    st.subheader("📋 Tipos de Teste Realizados")
    
    col1, col2 = st.columns(2)
    
    with col1:
        if 'codigotipoteste1' in df_filtered.columns:
            tipo_counts = df_filtered['codigotipoteste1'].value_counts().head(10)
            
            fig = px.pie(
                values=tipo_counts.values,
                names=tipo_counts.index,
                title="Proporção por Tipo de Teste",
                hole=0.4
            )
            
            st.plotly_chart(fig, use_container_width=True)
    
    with col2:
        if 'codigoresultadoteste1' in df_filtered.columns:
            resultado_counts = df_filtered['codigoresultadoteste1'].value_counts()
            
            fig = go.Figure(data=[go.Bar(
                x=resultado_counts.index,
                y=resultado_counts.values,
                marker=dict(
                    color=resultado_counts.values,
                    colorscale='RdYlGn_r'
                ),
                text=resultado_counts.values,
                textposition='outside'
            )])
            
            fig.update_layout(
                title="Distribuição de Resultados",
                xaxis_title="Resultado",
                yaxis_title="Quantidade"
            )
            
            st.plotly_chart(fig, use_container_width=True)
    
    # Fabricante dos testes
    st.markdown("---")
    st.subheader("🏭 Testes por Fabricante")
    
    if 'codigofabricanteteste1' in df_filtered.columns:
        fabricante_counts = df_filtered['codigofabricanteteste1'].value_counts().head(10)
        
        fig = px.bar(
            x=fabricante_counts.values,
            y=fabricante_counts.index,
            orientation='h',
            title="Top 10 Fabricantes de Testes",
            labels={'x': 'Quantidade', 'y': 'Fabricante'},
            color=fabricante_counts.values,
            color_continuous_scale='Blues'
        )
        
        fig.update_layout(height=450)
        st.plotly_chart(fig, use_container_width=True)
    
    # Total de testes realizados
    st.markdown("---")
    st.subheader("🔬 Estatísticas de Testes")
    
    if 'totaltestesrealizados' in df_filtered.columns:
        df_testes = df_filtered[df_filtered['totaltestesrealizados'].notna()]
        
        col1, col2, col3 = st.columns(3)
        
        with col1:
            st.metric("Total Médio de Testes", f"{df_testes['totaltestesrealizados'].mean():.2f}")
        
        with col2:
            st.metric("Máximo de Testes", f"{df_testes['totaltestesrealizados'].max():.0f}")
        
        with col3:
            st.metric("Mediana de Testes", f"{df_testes['totaltestesrealizados'].median():.0f}")

# ============================================================================
# SEÇÃO 6: MAPA DE CALOR
# ============================================================================
elif secao == "🗺️ Mapa de Calor":
    st.header("🗺️ Mapa de Calor - Densidade de Notificações")
    
    if 'municipionotificacao' in df_filtered.columns:
        # Coordenadas dos principais municípios do Pará (normalizadas em minúscula)
        coordenadas_para = {
            'belém': [-1.4558, -48.4902],
            'tucuruí': [-3.7661, -49.6728],
            'barcarena': [-1.5058, -48.6261],
            'ananindeua': [-1.3656, -48.3722],
            'castanhal': [-1.2936, -47.9264],
            'conceição do araguaia': [-8.2578, -49.2647],
            'itaituba': [-4.2761, -55.9836],
            'altamira': [-3.2033, -52.2064],
            'parauapebas': [-6.0675, -49.9019],
            'cametá': [-2.2444, -49.4964],
            'alenquer': [-1.9442, -54.7381],
            'marituba': [-1.3578, -48.3397],
            'santarém': [-2.4419, -54.7073],
            'ourilândia do norte': [-6.7542, -51.0819],
            'novo repartimento': [-4.2908, -49.9444],
            'marabá': [-5.3686, -49.1178],
            'oriximiná': [-1.7656, -55.8661],
            'canaã dos carajás': [-6.4967, -49.8778],
            'óbidos': [-1.9053, -55.5156],
            'tailândia': [-2.9469, -48.9528],
            'uruará': [-3.7194, -53.7356],
            'redenção': [-8.0289, -50.0306],
            'capanema': [-1.1950, -47.1808],
            'santana do araguaia': [-9.3181, -50.3269],
            'abaetetuba': [-1.7219, -48.8786],
            'vitória do xingu': [-2.8947, -52.0078],
            'breves': [-1.6819, -50.4806],
            'paragominas': [-2.9953, -47.3547],
            'maracanã': [-0.7764, -47.4536],
            'capitão poço': [-1.7461, -47.0597]
        }
        
        # Contar casos por município
        casos_municipio = df_filtered['municipionotificacao'].value_counts().reset_index()
        casos_municipio.columns = ['municipio', 'casos']
        
        # Normalizar nomes dos municípios para minúscula para fazer o match
        casos_municipio['municipio_norm'] = casos_municipio['municipio'].str.lower().str.strip()
        
        # Adicionar coordenadas usando nome normalizado
        casos_municipio['lat'] = casos_municipio['municipio_norm'].map(lambda x: coordenadas_para.get(x, [None, None])[0])
        casos_municipio['lon'] = casos_municipio['municipio_norm'].map(lambda x: coordenadas_para.get(x, [None, None])[1])
        
        casos_com_coord = casos_municipio.dropna(subset=['lat', 'lon'])
        
        if len(casos_com_coord) > 0:
            # Criar mapa base
            centro_para = [-4.0, -52.0]
            m = folium.Map(location=centro_para, zoom_start=6, tiles='OpenStreetMap')
            
            # Adicionar marcadores com círculos proporcionais
            max_casos = casos_com_coord['casos'].max()
            
            for _, row in casos_com_coord.iterrows():
                radius = (row['casos'] / max_casos) * 50000  # Escalar o raio
                
                folium.Circle(
                    location=[row['lat'], row['lon']],
                    radius=radius,
                    popup=f"<b>{row['municipio']}</b><br>Casos: {row['casos']:,}",
                    tooltip=f"{row['municipio']}: {row['casos']:,} casos",
                    color='red',
                    fill=True,
                    fillColor='red',
                    fillOpacity=0.4,
                    weight=2
                ).add_to(m)
                
                # Adicionar marcador
                folium.Marker(
                    location=[row['lat'], row['lon']],
                    popup=f"<b>{row['municipio']}</b><br>Casos: {row['casos']:,}",
                    icon=folium.Icon(color='red', icon='info-sign')
                ).add_to(m)
            
            # Adicionar legenda
            legend_html = '''
            <div style="position: fixed; 
                        bottom: 50px; right: 50px; width: 200px; height: 120px; 
                        background-color: white; border:2px solid grey; z-index:9999; 
                        font-size:14px; padding: 10px">
                <p style="margin:0"><b>Densidade de Casos</b></p>
                <p style="margin:5px 0">🔴 Tamanho do círculo = Nº de casos</p>
                <p style="margin:5px 0">📍 Clique nos marcadores para detalhes</p>
            </div>
            '''
            m.get_root().html.add_child(folium.Element(legend_html))
            
            # Exibir mapa
            folium_static(m, width=1200, height=600)
            
            st.markdown("---")
            
            # Tabela de municípios
            st.subheader("📊 Ranking de Municípios")
            
            col1, col2 = st.columns([2, 1])
            
            with col1:
                # Top 20 municípios
                top_municipios = casos_municipio.head(20)
                
                fig = px.bar(
                    top_municipios,
                    x='casos',
                    y='municipio',
                    orientation='h',
                    title="Top 20 Municípios com Mais Notificações",
                    labels={'casos': 'Número de Casos', 'municipio': 'Município'},
                    color='casos',
                    color_continuous_scale='Reds',
                    text='casos'
                )
                
                fig.update_traces(textposition='outside')
                fig.update_layout(height=600)
                
                st.plotly_chart(fig, use_container_width=True)
            
            with col2:
                st.dataframe(
                    casos_municipio.head(20)[['municipio', 'casos']],
                    column_config={
                        'municipio': 'Município',
                        'casos': st.column_config.NumberColumn('Casos', format='%d')
                    },
                    hide_index=True,
                    height=600
                )
        else:
            st.warning("⚠️ Não foi possível gerar o mapa. Coordenadas dos municípios não disponíveis.")
        
        # Mapa de calor temporal por região
        st.markdown("---")
        st.subheader("🔥 Mapa de Calor Temporal")
        
        if 'datanotificacao' in df_filtered.columns:
            df_heatmap = df_filtered[df_filtered['municipionotificacao'].notna()].copy()
            df_heatmap['ano_mes'] = df_heatmap['datanotificacao'].dt.to_period('M').astype(str)
            
            # Top 15 municípios
            top15 = df_heatmap['municipionotificacao'].value_counts().head(15).index
            df_heatmap = df_heatmap[df_heatmap['municipionotificacao'].isin(top15)]
            
            heatmap_data = df_heatmap.groupby(['ano_mes', 'municipionotificacao']).size().reset_index(name='casos')
            heatmap_pivot = heatmap_data.pivot(index='municipionotificacao', columns='ano_mes', values='casos')
            heatmap_pivot = heatmap_pivot.fillna(0)
            
            fig = px.imshow(
                heatmap_pivot,
                labels=dict(x="Período", y="Município", color="Casos"),
                title="Evolução Temporal dos Casos por Município (Top 15)",
                color_continuous_scale="YlOrRd",
                aspect="auto"
            )
            
            fig.update_layout(height=500)
            st.plotly_chart(fig, use_container_width=True)