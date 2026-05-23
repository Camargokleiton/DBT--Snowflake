# database_pipeline

## Overview

This is a dbt project built for Snowflake that models order and line-item data from the Snowflake TPC-H sample dataset. It includes:

- staging models for `orders` and `lineitem`
- an intermediate model to summarize order item amounts
- a final mart model for enriched order analysis
- source definitions for `snowflake_sample_data.tpch_sf1`
- a custom macro for calculating discounted amounts

## Prerequisites

- dbt Core installed
- Access to a Snowflake account with the `snowflake_sample_data.tpch_sf1` dataset
- A configured dbt profile named `database_pipeline`
- The `dbt_utils` package, defined in `packages.yml`

## Setup

1. Install dbt dependencies:

```bash
dbt deps
```

2. Confirm your Snowflake profile is configured in `~/.dbt/profiles.yml` with the `database_pipeline` profile.

3. Optionally validate your connection:

```bash
dbt debug
```

## Run the project

Build the models in the project:

```bash
dbt run
```

Run tests:

```bash
dbt test
```

## Project structure

- `models/staging/` - staging models that load and clean source data
- `models/staging/tpch_sources.yml` - source definitions for `orders` and `lineitem`
- `models/marts/` - intermediate and final models for analytics
- `macros/pricing.sql` - custom discount calculation macro
- `tests/` - project-specific SQL tests
- `packages.yml` - external package dependencies (dbt_utils)

## Notes

- The staging models reference the TPC-H Snowflake sample data source.
- Final models are materialized according to the project config in `dbt_project.yml`.
- If your Snowflake warehouse differs from `dbt_wh`, override the warehouse in your profile or model configs.

## Useful commands

```bash
dbt run

dbt test

dbt docs generate

dbt docs serve

## Versão em Português

## Visão geral

Este é um projeto dbt para Snowflake que modela dados de pedidos e itens de pedido a partir do conjunto de dados de amostra TPC-H do Snowflake. Ele inclui:

- modelos de staging para `orders` e `lineitem`
- um modelo intermediário para resumir os valores dos itens de pedido
- um modelo final de mart para análise de pedidos enriquecida
- definições de source para `snowflake_sample_data.tpch_sf1`
- uma macro customizada para calcular valores com desconto

## Pré-requisitos

- dbt Core instalado
- Acesso a uma conta Snowflake com o conjunto de dados `snowflake_sample_data.tpch_sf1`
- Um profile dbt configurado chamado `database_pipeline`
- O pacote `dbt_utils`, definido em `packages.yml`

## Configuração

1. Instale as dependências do dbt:

```bash
dbt deps
```

2. Confirme que seu profile Snowflake está configurado em `~/.dbt/profiles.yml` com o profile `database_pipeline`.

3. Opcionalmente, valide sua conexão:

```bash
dbt debug
```

## Executar o projeto

Construa os modelos do projeto:

```bash
dbt run
```

Execute os testes:

```bash
dbt test
```

## Estrutura do projeto

- `models/staging/` - modelos de staging que carregam e limpam os dados de origem
- `models/staging/tpch_sources.yml` - definições de source para `orders` e `lineitem`
- `models/marts/` - modelos intermediários e finais para analytics
- `macros/pricing.sql` - macro customizada para cálculo de desconto
- `tests/` - testes SQL específicos do projeto
- `packages.yml` - dependências externas do pacote (`dbt_utils`)

## Observações

- Os modelos de staging referenciam a fonte de dados de amostra TPC-H do Snowflake.
- Os modelos finais são materializados conforme a configuração em `dbt_project.yml`.
- Se seu warehouse Snowflake for diferente de `dbt_wh`, substitua o warehouse no profile ou nas configurações do modelo.

```
