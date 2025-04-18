USE survivor_data;

SELECT *
FROM dbo.contestants
WHERE contestant_name = 'Sonja Christopher'

SELECT *
FROM dbo.dim_contestant
WHERE contestant_name = 'Andrea Boehlke'

SELECT *
FROM dbo.fact_contestant_season
WHERE contestant_id = 26