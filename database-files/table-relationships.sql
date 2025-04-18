USE survivor_data

/*Establish foreign key constraint between fact_contestant_season and dim_contestant*/
IF OBJECT_ID('fk_dim_contestant', 'F') IS NOT NULL
BEGIN
	ALTER TABLE dbo.fact_contestant_season
	DROP CONSTRAINT fk_dim_contestant
END

ALTER TABLE dbo.fact_contestant_season
ADD CONSTRAINT fk_dim_contestant
FOREIGN KEY (dim_contestant_id)
REFERENCES dbo.dim_contestant(dim_contestant_id)

/*Establish foreign key constraint between fact_contestant_season and dim_season*/
IF OBJECT_ID('fk_dim_season', 'F') IS NOT NULL
BEGIN
	ALTER TABLE dbo.fact_contestant_season
	DROP CONSTRAINT fk_dim_season
END

ALTER TABLE dbo.fact_contestant_season
ADD CONSTRAINT fk_dim_season
FOREIGN KEY (season_id)
REFERENCES dbo.dim_season(season_id)
