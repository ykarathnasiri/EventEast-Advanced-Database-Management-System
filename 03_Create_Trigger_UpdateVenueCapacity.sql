USE EventEaseDB;
GO

-- Create Trigger
CREATE TRIGGER UpdateVenueCapacity
ON Ticket
AFTER INSERT
AS
BEGIN
    UPDATE v
    SET v.Capacity = v.Capacity - 1
    FROM Venue v
    INNER JOIN Event e ON v.VenueID = e.VenueID
    INNER JOIN inserted i ON e.EventID = i.EventID
    WHERE i.Status = 'Booked';
END;
GO

-- Test: Insert a ticket and check venue capacity
SELECT VenueID, Name, Capacity FROM Venue WHERE VenueID = 1;
INSERT INTO Ticket (EventID, AttendeeID, TicketType, Price, Status)
VALUES (1, 1, 'Regular', 50.00, 'Booked');
SELECT VenueID, Name, Capacity FROM Venue WHERE VenueID = 1;
GO