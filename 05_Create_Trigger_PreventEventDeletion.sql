USE EventEaseDB;
GO

-- Create Trigger
CREATE TRIGGER PreventEventDeletion
ON Event
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Ticket t
        INNER JOIN deleted d ON t.EventID = d.EventID
        WHERE t.Status = 'Booked'
    )
    BEGIN
        RAISERROR ('Cannot delete event with booked tickets.', 16, 1);
        ROLLBACK;
    END
    ELSE
    BEGIN
        DELETE FROM Event WHERE EventID IN (SELECT EventID FROM deleted);
    END
END;
GO

-- Test: Attempt to delete EventID 1
DELETE FROM Event WHERE EventID = 1;
SELECT EventID, Name FROM Event WHERE EventID = 1;
GO