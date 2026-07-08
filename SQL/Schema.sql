CREATE DATABASE IF NOT EXISTS ev_charging_db;
USE ev_charging_db;

DROP TABLE IF EXISTS ev_charging_data;

CREATE TABLE ev_charging_data (
    record_id INT PRIMARY KEY,
    date_time DATETIME NOT NULL,
    city_zone VARCHAR(20) NOT NULL,
    station_type VARCHAR(20) NOT NULL,
    vehicles_charged INT NOT NULL,
    avg_charging_duration_minutes DECIMAL(6,2) NOT NULL,
    energy_dispensed_kwh DECIMAL(8,2) NOT NULL,
    grid_load_mw DECIMAL(8,2) NOT NULL,
    renewable_energy_used_percent DECIMAL(5,2) NOT NULL,
    peak_load_risk VARCHAR(10) NOT NULL,
    hour_of_day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    day_of_week VARCHAR(10) NOT NULL,

    INDEX idx_zone (city_zone),
    INDEX idx_station_type (station_type),
    INDEX idx_date (date_time),
    INDEX idx_risk (peak_load_risk)
);

-- Load data (run from MySQL client, adjust path as needed)
-- LOAD DATA LOCAL INFILE 'ev_clean_data.csv'
-- INTO TABLE ev_charging_data
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (record_id, date_time, city_zone, station_type, vehicles_charged,
--  avg_charging_duration_minutes, energy_dispensed_kwh, grid_load_mw,
--  renewable_energy_used_percent, peak_load_risk
