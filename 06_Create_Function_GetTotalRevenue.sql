USE EventEaseDB;
GO

-- Create Function
CREATE FUNCTION GetTotalRevenue (@EventID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10,2);
    SELECT @TotalRevenue = SUM(Price)
    FROM Ticket
    WHERE EventID = @EventID AND Status = 'Booked';
    RETURN ISNULL(@TotalRevenue, 0);
END;
GO

-- Test: Get revenue for EventID 1
SELECT dbo.GetTotalRevenue(1) AS TotalRevenue;
GO