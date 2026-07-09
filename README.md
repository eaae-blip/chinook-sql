# 🎵 Chinook SQL Database Practice (20 Questions)

This repository contains a structured SQLite database analysis querying the standard **Chinook media store database** (representing a digital music store catalog and sales logs).

## 📊 Project Scope
The goal of this assignment is to query relational database tables to extract actionable business insights regarding regional revenue, genre popularity, catalog density, customer loyalty, and artist release frequencies.

## 🛠️ Tech Stack & Schema
*   **Database Engine:** SQLite / SQL
*   **Schema Scope:** Standard Chinook layout (`customers`, `invoices`, `tracks`, `genres`, `albums`, `artists`, `invoice_items`, and `employees` tables).

## 🔍 Query Directory
The SQL query script (**`chinok_sql_questions.sql`**) contains 20 progressive queries structured as follows:

*   **Q1 – Q8 (Single Table):** Genre searches, milliseconds conversions, unique country distributions, price metrics, pattern matching (`LIKE '%.com'`), counts, and standard average calculations.
*   **Q9 – Q11 (Grouping & Aggregations):** Customer counts by country, revenue per territory, and advanced filtering using the `HAVING` clause.
*   **Q12 – Q17 (Relational Joins):** Album-Artist mapping, track genres, Rock catalog isolates, artist inventories, and customer total spendings.
*   **Q18 – Q19 (Analytical Operations):** Identifing top revenue-generating track configurations and isolating underrepresented artists using a `LEFT JOIN`.
*   **Q20 (Advanced SQL):** Utilizing a Common Table Expression (CTE) to filter customers spending above the average baseline.