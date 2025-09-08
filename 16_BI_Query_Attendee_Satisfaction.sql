USE EventEaseDB;
GO

-- BI Query: Attendee Satisfaction Analysis
SELECT 
    e.Name AS EventName,
    dbo.GetAverageRating(e.EventID) AS AverageRating,
    COUNT(f.FeedbackID) AS FeedbackCount,
    COUNT(DISTINCT t.AttendeeID) AS Attendees
FROM Event e
LEFT JOIN Feedback f ON e.EventID = f.EventID
LEFT JOIN Ticket t ON e.EventID = t.EventID
WHERE t.Status = 'Booked'
GROUP BY e.Name, e.EventID
ORDER BY AverageRating DESC;
GO