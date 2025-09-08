USE EventEaseDB;
GO

-- BI Query: Event Popularity Report
SELECT 
    e.Name AS EventName,
    e.Type,
    v.Name AS VenueName,
    COUNT(t.TicketID) AS TicketsSold,
    dbo.GetAttendeeCount(e.EventID) AS AttendeeCount
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
LEFT JOIN Ticket t ON e.EventID = t.EventID
WHERE t.Status = 'Booked'
GROUP BY e.Name, e.Type, v.Name, e.EventID
ORDER BY TicketsSold DESC;
GO