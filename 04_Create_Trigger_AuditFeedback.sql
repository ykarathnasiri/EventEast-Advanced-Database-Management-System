USE EventEaseDB;
GO

-- Create FeedbackAudit Table
CREATE TABLE FeedbackAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    FeedbackID INT,
    EventID INT,
    AttendeeID INT,
    Rating INT,
    Comment VARCHAR(500),
    SubmittedDate DATE,
    AuditAction VARCHAR(50),
    AuditDate DATETIME DEFAULT GETDATE()
);

-- Create Trigger
CREATE TRIGGER AuditFeedback
ON Feedback
AFTER INSERT
AS
BEGIN
    INSERT INTO FeedbackAudit (FeedbackID, EventID, AttendeeID, Rating, Comment, SubmittedDate, AuditAction)
    SELECT FeedbackID, EventID, AttendeeID, Rating, Comment, SubmittedDate, 'INSERT'
    FROM inserted;
END;
GO

-- Test: Insert feedback and check audit table
INSERT INTO Feedback (EventID, AttendeeID, Rating, Comment, SubmittedDate)
VALUES (1, 1, 5, 'Excellent organization!', '2025-06-18');
SELECT AuditID, FeedbackID, EventID, AttendeeID, Rating, Comment, AuditAction, AuditDate
FROM FeedbackAudit
WHERE EventID = 1 AND AttendeeID = 1;
GO