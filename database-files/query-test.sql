USE survivor_data;

WITH hometown_changes AS (
	SELECT contestant_name,
		hometown,
		num_season AS effective_season,
		LAG(hometown) OVER (PARTITION BY contestant_name ORDER BY num_season) AS prior_hometown,
		MAX(hometown) OVER (PARTITION BY contestant_name) AS current_hometown
	FROM dbo.contestants)

SELECT contestant_name,
	hometown,
	effective_season,
	CASE
		WHEN current_hometown = hometown
		THEN 1
		ELSE 0
	END AS current_hometown_ind
FROM hometown_changes
WHERE hometown <> prior_hometown OR hometown <> NULL
ORDER BY contestant_name
