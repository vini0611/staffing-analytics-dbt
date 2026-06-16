# Staffing Analytics dbt Project

A production-ready dbt analytics pipeline built for an IT staffing company. Implements the Medallion Architecture (Bronze → Silver → Gold) to transform raw staffing data into business-ready analytics tables.

## Business Context

This pipeline answers key business questions for a staffing company:
- Which candidates are currently placed and generating revenue?
- Which clients bring the most placements and revenue?
- What does the sales pipeline look like?
- What is our margin per placement?

## Tech Stack
- dbt Core 1.11.11
- DuckDB local analytical database
- Python 3.11

## Medallion Architecture

- Bronze seeds/ — Raw CSV data simulating source systems
- Silver staging/ — Cleaned, renamed, typed 1:1 with sources
- Gold marts/ — Business-ready joined and aggregated tables

## Data Models

### Fact Tables
- fct_placements — One row per placement with bill rate, pay rate and margin
- fct_pipeline — One row per sales opportunity with weighted pipeline value

### Dimension Tables
- dim_candidates — One row per candidate with total placements and revenue generated
- dim_clients — One row per client with total revenue and open pipeline value

## Seeds Bronze Layer
- raw_candidates.csv — 100 IT candidates
- raw_clients.csv — 50 client companies
- raw_job_orders.csv — 70 job orders
- raw_placements.csv — 50 placements
- raw_opportunities.csv — 50 sales opportunities

## Tests
- 55 data quality tests across all models
- Unique and not_null checks on all primary keys
- Referential integrity checks between fact and dimension tables
- Accepted values checks on all status columns

## Setup

Clone the repo and navigate into it, then create a virtual environment and activate it, install dbt with pip install dbt-duckdb, configure your profiles.yml for DuckDB, then run dbt build to execute the full pipeline.

## Commands
- dbt seed — Load raw CSV data
- dbt run — Build all models
- dbt test — Run all data quality tests
- dbt build — Run everything at once
- dbt docs generate — Generate documentation
- dbt docs serve — View docs at http://localhost:8080