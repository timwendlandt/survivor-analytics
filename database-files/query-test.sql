﻿USE survivor_data;

SELECT COUNT(sub1.contestants) AS number_of_contestants,
	SUM(CASE
			WHEN sub1.number_of_seasons_played = 1
			THEN 1
			ELSE 0
		END) AS number_of_onetime_contestants,
	SUM(CASE
			WHEN sub1.number_of_seasons_played > 1
			THEN 1
			ELSE 0
		END) AS number_of_multiseason_contestants,
	(SUM(CASE
			WHEN sub1.number_of_seasons_played = 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(sub1.contestants)) * 100.0 AS percentage_of_onetime_contestants,
	(SUM(CASE
			WHEN sub1.number_of_seasons_played > 1
			THEN 1
			ELSE 0
		END)*1.0/COUNT(sub1.contestants)) * 100.0 AS percentage_of_multiseason_contestants
FROM (
	SELECT contestant_id AS contestants, COUNT(contestant_id) AS number_of_seasons_played
	FROM dim_contestant
	GROUP BY contestant_id) sub1