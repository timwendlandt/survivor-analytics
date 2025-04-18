USE survivor_data;

/*fact_contestant_season creation*/
IF OBJECT_ID('dbo.fact_contestant_season', 'U') IS NOT NULL
	DROP TABLE dbo.fact_contestant_season

SELECT num_season AS season_id,
	contestant_id,
	finish,
	num_appearance,
	merge_made,
	jury,
	ftc,
	votes_against,
	num_boot,
	quit,
	evac,
	ejected,
	fmc,
	num_jury_votes,
	normalized_finish
INTO fact_contestant_season
FROM dbo.contestants

/*Add surrogate key (contestant_id, season_id)*/
ALTER TABLE dbo.fact_contestant_season ADD contestant_season_id INT IDENTITY(1,1)
ALTER TABLE dbo.fact_contestant_season ADD CONSTRAINT pk_contestant_season_id PRIMARY KEY (contestant_season_id)
ALTER TABLE dbo.fact_contestant_season ADD CONSTRAINT unique_contestant_season UNIQUE(contestant_id, season_id)

/*Add dim_contestant_id*/
ALTER TABLE dbo.fact_contestant_season ADD dim_contestant_id INT

UPDATE f
SET f.dim_contestant_id = d.dim_contestant_id
FROM dbo.fact_contestant_season f
JOIN dbo.dim_contestant d
	ON f.contestant_id = d.contestant_id
	AND f.season_id >= d.effective_season
	AND (f.season_id <= d.end_season OR d.end_season IS NULL)


SELECT *
FROM dbo.fact_contestant_season