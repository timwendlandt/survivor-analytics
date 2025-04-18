USE survivor_data;

/*dim_season creation*/
IF OBJECT_ID('dbo.dim_season', 'U') IS NOT NULL
	DROP TABLE dbo.dim_season
	
SELECT DISTINCT winner,
	merged_tribe,
	season,
	num_season,
	num_season AS season_id
INTO dim_season
FROM dbo.season

ALTER TABLE dbo.dim_season ALTER COLUMN season_id INT NOT NULL
ALTER TABLE dbo.dim_season ADD CONSTRAINT pk_season_id PRIMARY KEY (season_id)

SELECT *
FROM dbo.dim_season
