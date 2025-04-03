USE survivor_data;

/*fact_contestant_season creation*/
SELECT num_season,
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

ALTER TABLE dbo.fact_contestant_season ADD contestant_season_id INT IDENTITY(1,1)
ALTER TABLE dbo.fact_contestant_season ADD CONSTRAINT pk_contestant_season_id PRIMARY KEY (contestant_season_id)
ALTER TABLE dbo.fact_contestant_season ADD CONSTRAINT unique_contestant_season UNIQUE(contestant_id, num_season)

SELECT *
FROM dbo.fact_contestant_season