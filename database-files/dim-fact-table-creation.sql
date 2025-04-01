USE survivor_data

DROP TABLE dbo.dim_contestants

/*dim_contestant creation*/
SELECT DISTINCT contestant_name,
	hometown,
	profession,
	state_from,
	country,
	birthdate,
	gender
INTO dim_contestants
FROM dbo.contestants

/*Add a surrogate primary key (contestant_name, num_season)*/
ALTER TABLE dbo.dim_contestants ADD contestant_id INT IDENTITY(1,1)
ALTER TABLE dbo.dim_contestants ADD CONSTRAINT pk_contestant_id PRIMARY KEY (contestant_id)

SELECT *
FROM dbo.dim_contestants
ORDER BY contestant_name