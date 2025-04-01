USE survivor_data

/*Create table and load contestant_table csv*/
CREATE TABLE contestants(
	contestant_name VARCHAR(75),
	age INT,
	hometown VARCHAR(75),
	profession VARCHAR(75),
	num_season INT,
	finish INT,
	gender VARCHAR(2),
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

SELECT * FROM dbo.contestants

/*Create table and load season_table csv*/
CREATE TABLE season(
	num_season INT,
	season VARCHAR(75),
	merged_tribe VARCHAR(75),
	num_merge INT,
	day_merge INT,
	num_jury INT,
	num_ftc INT,
	num_swaps INT,
	num_contestants INT,
	redemption_island INT,
	edge_of_extinction INT,
	num_days INT,
	african_american INT,
	asian_american INT,
	latin_american INT,
	poc INT,
	lgbt INT,
	jewish INT,
	muslim INT,
	num_quits INT,
	num_evacs INT,
	winner VARCHAR(75)
);

BULK INSERT dbo.season
FROM 'C:\Temp\season_table.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

SELECT * FROM dbo.season

/*Create table and load tribe_table csv*/
CREATE TABLE tribe(
	num_season INT,
	tribe VARCHAR(75),
	iter_num INT,
	num_contestants INT,
	merge_ind INT,
	african_american INT,
	asian_american INT,
	latin_american INT,
	poc INT,
	jewish INT,
	muslim INT,
	lgbt INT,
	male INT,
	female INT,
	non_binary INT,
	color VARCHAR(50)
);

BULK INSERT dbo.tribe
FROM 'C:\Temp\tribe_table.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2
);

SELECT * FROM dbo.tribe