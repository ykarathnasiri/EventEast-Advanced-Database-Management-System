USE EventEaseDB;
GO

-- Create View
CREATE VIEW EventDetails AS
SELECT 
    e.EventID,
    e.Name AS EventName,
    e.Type,
    e.StartDate,
    e.EndDate,
    v.Name AS VenueName,
    o.Name AS OrganizerName,
    o.Email AS OrganizerEmail
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
JOIN Organizer o ON e.OrganizerID = o.OrganizerID;
GO

-- Test: Query view for first 3 events
SELECT EventID, EventName, Type, VenueName, OrganizerName
FROM EventDetails
WHERE EventID <= 3;
GO