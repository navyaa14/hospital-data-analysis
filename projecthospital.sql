CREATE DATABASE HospitalDB;
USE HospitalDB;
CREATE TABLE hosp (
    `Provider ID` INT PRIMARY KEY,
    `Hospital Name` VARCHAR(255),
    `Address` VARCHAR(255),
    `City` VARCHAR(100),
    `State` VARCHAR(50),
    `ZIP Code` VARCHAR(20),
    `County Name` VARCHAR(100),
    `Phone Number` VARCHAR(20),
    `Hospital Type` VARCHAR(100),
    `Hospital Ownership` VARCHAR(100),
    `Emergency Services` VARCHAR(50),
    `Meets criteria for meaningful use of EHRs` VARCHAR(50),
    `Hospital overall rating` VARCHAR(10),
    `Hospital overall rating footnote` VARCHAR(255),
    `Mortality national comparison` VARCHAR(100),
    `Mortality national comparison footnote` VARCHAR(255),
    `Safety of care national comparison` VARCHAR(100),
    `Safety of care national comparison footnote` VARCHAR(255),
    `Readmission national comparison` VARCHAR(100),
    `Readmission national comparison footnote` VARCHAR(255),
    `Patient experience national comparison` VARCHAR(100),
    `Patient experience national comparison footnote` VARCHAR(255),
    `Effectiveness of care national comparison` VARCHAR(100),
    `Effectiveness of care national comparison footnote` VARCHAR(255),
    `Timeliness of care national comparison` VARCHAR(100),
    `Timeliness of care national comparison footnote` VARCHAR(255),
    `Efficient use of medical imaging national comparison` VARCHAR(100),
    `Efficient use of medical imaging national comparison footnote` VARCHAR(255)
    
);
SELECT State, COUNT(*) AS Total_Hospitals
FROM hosp
GROUP BY State
ORDER BY Total_Hospitals DESC;
SELECT State, AVG(CAST(`Hospital overall rating` AS UNSIGNED)) AS Avg_Rating
FROM hosp
WHERE `Hospital overall rating` REGEXP '^[0-9]+$'
GROUP BY State
ORDER BY Avg_Rating DESC;
SELECT `Hospital Type`, COUNT(*) AS Total
FROM hosp
GROUP BY `Hospital Type`;
SELECT `Hospital Name`, City, State
FROM hosp
WHERE `Mortality national comparison` = 'Below the national average';
SELECT `Hospital Ownership`, COUNT(*) AS Total_Hospitals,
       SUM(CASE WHEN `Emergency Services` = 'TRUE' THEN 1 ELSE 0 END) AS Emergency_Enabled
FROM hosp
GROUP BY `Hospital Ownership`;








