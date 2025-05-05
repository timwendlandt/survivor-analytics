USE survivor_data;

/*How many players have played? played once? played more than once?*/
WITH contestantcounts AS (
	SELECT contestant_id AS contestants, COUNT(contestant_id) AS number_of_seasons_played
	FROM dim_contestant
	GROUP BY contestant_id)

SELECT COUNT(contestants) AS number_of_contestants,
	SUM(CASE
			WHEN number_of_seasons_played = 1
			THEN 1
			ELSE 0
		END) AS number_of_onetime_contestants,
	SUM(CASE
			WHEN number_of_seasons_played > 1
			THEN 1
			ELSE 0
		END) AS number_of_multiseason_contestants,
	(SUM(CASE
			WHEN number_of_seasons_played = 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(contestants)) * 100.0 AS percentage_of_onetime_contestants,
	(SUM(CASE
			WHEN number_of_seasons_played > 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(contestants)) * 100.0 AS percentage_of_multiseason_contestants
FROM contestantcounts;

/*What % of multiseason players have won? What % of single season players have won*/
WITH winnercounts AS (
	SELECT f.contestant_id AS contestants, COUNT(f.contestant_id) AS number_of_seasons_won
	FROM fact_contestant_season f

	WHERE f.finish = 1

	GROUP BY f.contestant_id)

SELECT COUNT(contestants) AS number_of_winners,
	SUM(CASE
			WHEN number_of_seasons_won = 1
			THEN 1
			ELSE 0
		END) AS number_of_onetime_winners,
	SUM(CASE
			WHEN number_of_seasons_won > 1
			THEN 1
			ELSE 0
		END) AS number_of_multiseason_winners,
	(SUM(CASE
			WHEN number_of_seasons_won = 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(contestants)) * 100.0 AS percentage_of_onetime_winners,
	(SUM(CASE
			WHEN number_of_seasons_won > 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(contestants)) * 100.0 AS percentage_of_multiseason_winners
FROM winnercounts;



