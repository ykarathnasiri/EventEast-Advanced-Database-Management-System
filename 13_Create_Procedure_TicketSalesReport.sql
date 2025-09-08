USE EventEaseDB;
GO

-- Create Procedure
CREATE PROCEDURE TicketSalesReport
AS
BEGIN
    SELECT 
        e.Name AS EventName,
        COUNT(t.TicketID) AS TicketsSold,
        SUM(t.Price) AS TotalRevenue
    FROM Event e
    LEFT JOIN Ticket t ON e.EventID = t.EventID
    WHERE t.Status = 'Booked'
    GROUP BY e.Name
    ORDER BY TotalRevenue DESC;
END;
GO

-- Test: Run the report
EXEC TicketSalesReport;
GO