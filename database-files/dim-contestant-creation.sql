USE survivor_data;

/*dim_contestant creation*/
IF OBJECT_ID('dbo.dim_contestant', 'U') IS NOT NULL
	DROP TABLE dbo.dim_contestant;
	
WITH type_two_dims AS (
	SELECT contestant_name,
		contestant_id,
		hometown,
		profession,
		state_from,
		country,
		birthdate,
		gender,
		num_season AS effective_season,
		LAG(hometown) OVER (PARTITION BY contestant_name ORDER BY num_season) AS prior_hometown,
		FIRST_VALUE(hometown) OVER (PARTITION BY contestant_name ORDER BY num_season DESC) AS current_hometown,
		LAG(profession) OVER (PARTITION BY contestant_name ORDER BY num_season) AS prior_profession,
		FIRST_VALUE(profession) OVER (PARTITION BY contestant_name ORDER BY num_season DESC) AS current_profession
	FROM dbo.contestants)

SELECT contestant_name,
	contestant_id,
	state_from,
	country,
	birthdate,
	gender,
	hometown,
	profession,
	effective_season,
	CASE
		WHEN current_hometown = hometown AND current_profession = profession
		THEN 1
		ELSE 0
	END AS is_current_ind
INTO dim_contestant
FROM type_two_dims
WHERE (hometown <> prior_hometown OR prior_hometown IS NULL) OR (profession <> prior_profession OR prior_profession IS NULL)
ORDER BY contestant_name

/*Add a surrogate primary key (contestant_name, num_season)*/
ALTER TABLE dbo.dim_contestant ADD dim_contestant_id INT IDENTITY(1,1)
ALTER TABLE dbo.dim_contestant ADD CONSTRAINT pk_contestant_id PRIMARY KEY (dim_contestant_id)

SELECT *
FROM dbo.dim_contestant
ORDER BY contestant_name
