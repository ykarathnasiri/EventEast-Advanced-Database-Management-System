USE EventEaseDB;
GO

-- Create Procedure
CREATE PROCEDURE InsertEvent
    @Name VARCHAR(100),
    @Description VARCHAR(500),
    @Type VARCHAR(50),
    @StartDate DATE,
    @EndDate DATE,
    @StartTime TIME,
    @EndTime TIME,
    @VenueID INT,
    @OrganizerID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Venue WHERE VenueID = @VenueID)
    BEGIN
        RAISERROR ('Invalid VenueID.', 16, 1);
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM Organizer WHERE OrganizerID = @OrganizerID)
    BEGIN
        RAISERROR ('Invalid OrganizerID.', 16, 1);
        RETURN;
    END
    IF @EndDate < @StartDate
    BEGIN
        RAISERROR ('EndDate must be greater than or equal to StartDate.', 16, 1);
        RETURN;
    END
    INSERT INTO Event (Name, Description, Type, StartDate, EndDate, StartTime, EndTime, VenueID, OrganizerID)
    VALUES (@Name, @Description, @Type, @StartDate, @EndDate, @StartTime, @EndTime, @VenueID, @OrganizerID);
END;
GO

-- Test: Insert a new event
EXEC InsertEvent 
    @Name = 'Data Science Workshop',
    @Description = 'Hands-on data science training',
    @Type = 'Conference',
    @StartDate = '2026-05-01',
    @EndDate = '2026-05-02',
    @StartTime = '09:00',
    @EndTime = '17:00',
    @VenueID = 1,
    @OrganizerID = 1;
SELECT EventID, Name, StartDate, EndDate, VenueID, OrganizerID
FROM Event
WHERE Name = 'Data Science Workshop';
GO