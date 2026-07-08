-- EV Charging Growth & Demand Analysis
-- Interview-ready analysis queries (MySQL)

-- 1. Total vehicles charged and energy dispensed by zone
SELECT city_zone,
       SUM(vehicles_charged) AS total_vehicles,
       ROUND(SUM(energy_dispensed_kwh), 2) AS total_energy_kwh,
       ROUND(AVG(grid_load_mw), 2) AS avg_grid_load_mw
FROM ev_charging_data
GROUP BY city_zone
ORDER BY total_vehicles DESC;

-- 2. Demand by station type
SELECT station_type,
       COUNT(*) AS sessions,
       SUM(vehicles_charged) AS total_vehicles,
       ROUND(AVG(avg_charging_duration_minutes), 2) AS avg_duration_min
FROM ev_charging_data
GROUP BY station_type
ORDER BY total_vehicles DESC;

-- 3. Peak charging hours (top 5 hours of day by vehicle demand)
SELECT hour_of_day,
       SUM(vehicles_charged) AS total_vehicles,
       ROUND(AVG(grid_load_mw), 2) AS avg_grid_load_mw
FROM ev_charging_data
GROUP BY hour_of_day
ORDER BY total_vehicles DESC
LIMIT 5;

-- 4. Monthly growth trend in demand
SELECT month,
       SUM(vehicles_charged) AS total_vehicles,
       ROUND(SUM(energy_dispensed_kwh), 2) AS total_energy_kwh
FROM ev_charging_data
GROUP BY month
ORDER BY month;

-- 5. Day-of-week demand pattern (weekday vs weekend)
SELECT day_of_week,
       SUM(vehicles_charged) AS total_vehicles,
       ROUND(AVG(vehicles_charged), 2) AS avg_vehicles_per_hour
FROM ev_charging_data
GROUP BY day_of_week
ORDER BY total_vehicles DESC;

-- 6. Peak load risk distribution by zone
SELECT city_zone,
       peak_load_risk,
       COUNT(*) AS occurrences
FROM ev_charging_data
GROUP BY city_zone, peak_load_risk
ORDER BY city_zone, peak_load_risk;

-- 7. Zones with highest share of High-risk peak load
SELECT city_zone,
       SUM(CASE WHEN peak_load_risk = 'High' THEN 1 ELSE 0 END) AS high_risk_count,
       COUNT(*) AS total_records,
       ROUND(100.0 * SUM(CASE WHEN peak_load_risk = 'High' THEN 1 ELSE 0 END) / COUNT(*), 2) AS high_risk_pct
FROM ev_charging_data
GROUP BY city_zone
ORDER BY high_risk_pct DESC;

-- 8. Renewable energy usage trend by month
SELECT month,
       ROUND(AVG(renewable_energy_used_percent), 2) AS avg_renewable_pct
FROM ev_charging_data
GROUP BY month
ORDER BY month;

-- 9. Correlation-style view: grid load vs renewable usage by risk level
SELECT peak_load_risk,
       ROUND(AVG(grid_load_mw), 2) AS avg_grid_load_mw,
       ROUND(AVG(renewable_energy_used_percent), 2) AS avg_renewable_pct
FROM ev_charging_data
GROUP BY peak_load_risk
ORDER BY avg_grid_load_mw DESC;

-- 10. Top 5 highest single-hour demand spikes (outlier detection)
SELECT record_id, date_time, city_zone, station_type, vehicles_charged, grid_load_mw
FROM ev_charging_data
ORDER BY vehicles_charged DESC
LIMIT 5;

-- 11. Station type efficiency: energy dispensed per vehicle
SELECT station_type,
       ROUND(SUM(energy_dispensed_kwh) / SUM(vehicles_charged), 2) AS avg_kwh_per_vehicle
FROM ev_charging_data
GROUP BY station_type
ORDER BY avg_kwh_per_vehicle DESC;
