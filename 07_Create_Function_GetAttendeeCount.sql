USE EventEaseDB;
GO

-- Create Function
CREATE FUNCTION GetAttendeeCount (@EventID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*)
    FROM Ticket
    WHERE EventID = @EventID AND Status = 'Booked';
    RETURN @Count;
END;
GO

-- Test: Get attendee count for EventID 1
SELECT dbo.GetAttendeeCount(1) AS AttendeeCount;
GO