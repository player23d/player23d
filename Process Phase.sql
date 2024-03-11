-- Process Phase --

-- Identify and Remove Null values --
SELECT *
FROM dbo.cyclistic_bike
WHERE
ride_id IS NULL
OR rideable_type IS NULL
OR started_at IS NULL
OR ended_at  IS NULL 
OR start_station_name IS NULL
OR end_station_name IS NULL
OR member_casual IS NULL;

DELETE FROM dbo.cyclistic_bike
WHERE
ride_id IS NULL
OR rideable_type IS NULL
OR started_at IS NULL
OR ended_at  IS NULL 
OR start_station_name IS NULL
OR end_station_name IS NULL
OR member_casual IS NULL;

-- Identify and remove duplicate values --
SELECT *,
COUNT(*) AS duplicatecount
FROM cyclistic_bike
GROUP BY 
ride_id,
rideable_type,
started_at,
ended_at,
start_station_name,
end_station_name,
member_casual
HAVING COUNT(*) >1;

