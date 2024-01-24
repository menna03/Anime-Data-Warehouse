Alter PROCEDURE LoadStagingData
AS
BEGIN
    BEGIN TRY
		drop table stagingRating

		drop table StagingAnime

		
		CREATE TABLE StagingRating (
			user_id VARCHAR(255),
			anime_id VARCHAR(255),
			rating VARCHAR(255)
		);
		CREATE TABLE StagingAnime (
			anime_id VARCHAR(255),
			name VARCHAR(255),
			genre VARCHAR(255),
			type VARCHAR(255),
			episodes VARCHAR(255),
			rating VARCHAR(255),
			members VARCHAR(255)
		);
-----------------------------------------------------------------
        -- Bulk insert data into StagingRating table
	BULK INSERT StagingRating
        
		FROM 'C:\Users\menna\Desktop\DB\Dataset\rating.csv'

        WITH (
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            FIRSTROW = 2 -- Skip header row
        );

-------- Bulk insert data into StagingAnime table with error handling and data cleaning
	BULK INSERT StagingAnime
		
	FROM 'C:\Users\menna\Desktop\DB\Dataset\anime.csv'

		WITH (
			FORMAT='CSV',
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			ROWTERMINATOR='\n',
    		TABLOCK
		);

--------- Additional data cleaning or validation steps can be added here

        PRINT 'Data loaded successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors
        PRINT 'Error loading data. Check error log for details.';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
EXEC LoadStagingData;