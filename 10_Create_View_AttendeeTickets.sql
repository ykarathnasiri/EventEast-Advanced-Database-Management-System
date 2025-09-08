USE EventEaseDB;
GO

-- Create View
CREATE VIEW AttendeeTickets AS
SELECT 
    e.Name AS EventName,
    a.FullName,
    t.TicketID,
    t.TicketType,
    t.Price,
    t.Status
FROM Ticket t
JOIN Event e ON t.EventID = e.EventID
JOIN Attendee a ON t.AttendeeID = a.AttendeeID;
GO

-- Test: Query view for Tech Conference 2025
SELECT EventName, FullName, TicketID, TicketType, Price
FROM AttendeeTickets
WHERE EventName = 'Tech Conference 2025';
GO