# EV Charging Growth & Demand Analysis

## 🔗 Live Dashboard
[Click here to view Power BI Dashboard](https://app.powerbi.com/links/wuwhrc_cZg?ctid=377383c2-3be0-4e01-b2c8-8526d5e58adb&pbi_source=linkShare )

## 📊 Project Overview
This project analyzes 2,800 hourly EV charging records (Jan–Apr 2024) across 5 city zones and 3 station types to uncover demand trends, peak load risk, and renewable energy adoption patterns — helping simulate how a city or utility company might plan charging infrastructure.

## 🛠️ Tech Stack
- SQL (MySQL) — schema design, indexing, aggregate queries
- Excel — pivot-style summaries, dashboard, formulas (SUMIF, AVERAGEIF, COUNTIFS)
- Python (Pandas, Matplotlib, Seaborn) — data cleaning, EDA, feature engineering
- Power BI — interactive dashboard and visualizations

## 📁 Repository Structure
- sql/ — schema.sql, queries.sql, sql_analysis_notes.md
- excel/ — EV_Charging_Analysis.xlsx (dashboard, zone/station/monthly summaries)
- notebooks/ — Python EDA notebook
- powerbi/ — Power BI dashboard file
- README.md

## 🔑 Key Insights
- North zone leads in demand with 7,551 vehicles charged and 106,516 kWh dispensed
- Central zone has the highest share of high-risk peak load events (22%)
- Renewable energy usage rose from 43.8% (Jan) to ~45% by April
- Superchargers deliver the most energy per vehicle (15.01 kWh) vs. Fast (14.24) and Normal (14.07)
- Demand is fairly evenly spread across weekdays — not as commute-driven as typically assumed

## 🗄️ SQL Layer
Cleaned data was loaded into a MySQL table with indexes on zone, station type, and date for query performance. Queries answer business questions like peak demand hours, zone-level risk exposure, and renewable energy trends. See sql/sql_analysis_notes.md for full results.

## 📈 Excel Layer
A dynamic workbook with live formulas (not hardcoded values) covering:
- Dashboard with key KPIs
- Zone-wise summary + chart
- Station type efficiency summary + chart
- Monthly demand trend + chart

## 🐍 Python EDA
Exploratory data analysis covering feature engineering, distribution analysis, and correlation checks between grid load, renewable usage, and peak risk.

## 📊 Power BI Dashboard
Interactive dashboard visualizing zone-wise demand, station type breakdown, and monthly trends. [Add your Power BI Service link here]

## 🎯 How This Project Was Built
Data was cleaned and structured, loaded into MySQL for query-based analysis, cross-checked in Excel with pivot-style summaries, explored in Python for deeper EDA, and visualized in Power BI for stakeholder-friendly reporting — replicating a realistic end-to-end analyst workflow.
