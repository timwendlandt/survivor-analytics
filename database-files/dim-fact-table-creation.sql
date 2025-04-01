USE survivor_data

/*dim_contestant creation*/
SELECT contestant_name,
	age,
	hometown,
	profession,
	num_season,
	finish,
	state_from,
	country,
	num_appearance,
	birthdate,
	merge_made,
	jury,
	ftc,
	num_boot,
	tribe1,
	tribe2,
	tribe3
INTO dim_contestants
FROM dbo.contestants

/*Add a surrogate primary key (contestant_name, num_season)*/
ALTER TABLE dbo.dim_contestants ADD contestant_id INT IDENTITY(1,1)
ALTER TABLE dbo.dim_contestants ADD CONSTRAINT pk_contestant_id PRIMARY KEY (contestant_id)

SELECT *
FROM dbo.dim_contestants