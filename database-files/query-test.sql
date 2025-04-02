USE survivor_data;

WITH hometown_changes AS (
	SELECT contestant_name,
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
FROM hometown_changes
WHERE ((hometown <> prior_hometown OR prior_hometown IS NULL) OR (profession <> prior_profession OR prior_profession IS NULL)) AND contestant_name = 'Tyson Apostol'
ORDER BY contestant_name
