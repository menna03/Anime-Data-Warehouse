-- Create a separate stored procedure for sending email
Alter PROCEDURE SendEmail
    @Subject NVARCHAR(255),
    @Body NVARCHAR(1000)
AS
BEGIN
    -- Check if the mail profile exists
    IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysmail_profile WHERE name = 'Menna')
    BEGIN
        PRINT 'Mail profile does not exist.';
        RETURN; -- Exit the stored procedure if the mail profile does not exist
    END

    -- Send email notification
    EXEC msdb.dbo.sp_send_dbmail
        @profile_name = 'Menna', -- Specify your mail profile
        @recipients = 'osamamenna1511@gmail.com', -- System administrator's email
        @subject = @Subject,
        @body = @Body;
END;
GO

-- Create the main stored procedure
 Alter PROCEDURE SendEmailNotification
AS
BEGIN
    DECLARE @ResultMessage NVARCHAR(1000);

    BEGIN TRY
        -- Your logic to determine the result of the data loading process
        -- For example, query a log table to check the status

        -- Set the result message based on the success or failure
        SET @ResultMessage = 'Data loading process succeeded.';
    END TRY
    BEGIN CATCH
        -- Log error details or take appropriate action
        SET @ResultMessage = 'Data loading process failed. Check the error logs for details.';
    END CATCH;

    -- Call the separate stored procedure to send email
    EXEC SendEmail
        @Subject = 'Data Loading Process Result',
        @Body = @ResultMessage;
END;
GO
EXEC SendEmailNotification;