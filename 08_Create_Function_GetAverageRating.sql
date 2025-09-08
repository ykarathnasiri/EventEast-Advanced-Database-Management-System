USE EventEaseDB;
GO

-- Create Function
CREATE FUNCTION GetAverageRating (@EventID INT)
RETURNS DECIMAL(3,1)
AS
BEGIN
    DECLARE @AvgRating DECIMAL(3,1);
    SELECT @AvgRating = AVG(CAST(Rating AS DECIMAL(3,1)))
    FROM Feedback
    WHERE EventID = @EventID;
    RETURN ISNULL(@AvgRating, 0);
END;
GO

-- Test: Get average rating for EventID 1
SELECT dbo.GetAverageRating(1) AS AverageRating;
GO