USE EventEaseDB;
GO

-- Create View
CREATE VIEW EventFeedbackSummary AS
SELECT 
    e.Name AS EventName,
    COUNT(f.FeedbackID) AS FeedbackCount,
    AVG(CAST(f.Rating AS DECIMAL(3,1))) AS AverageRating
FROM Event e
LEFT JOIN Feedback f ON e.EventID = f.EventID
GROUP BY e.Name;
GO

-- Test: Query view for events with feedback
SELECT EventName, FeedbackCount, AverageRating
FROM EventFeedbackSummary
WHERE FeedbackCount > 0
ORDER BY AverageRating DESC;
GO