USE survivor_data

DROP TABLE dbo.contestants;

CREATE TABLE contestants(
	contestant_name VARCHAR(75),
	age INT,
	hometown VARCHAR(75),
	profession VARCHAR(75),
	num_season VARCHAR(75),
	finish INT,
	gender VARCHAR(5),
	african_american INT,
	asian_american INT,
	latin_american INT,
	poc INT,
	jewish INT,
	muslim INT,
	lgbt INT,
	state_from VARCHAR(75),
	country VARCHAR(25),
	num_appearance INT,
	birthdate DATE,
	merge_made INT,
	jury INT,
	ftc INT,
	votes_against INT,
	num_boot INT,
	tribe1 VARCHAR(75),
	tribe2 VARCHAR(75),
	tribe3 VARCHAR(75),
	quit INT,
	evac INT,
	ejected INT,
	fmc INT,
	num_jury_votes INT,
	normalized_finish FLOAT
);

BULK INSERT dbo.contestants
FROM 'C:\Temp\contestant_table.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

