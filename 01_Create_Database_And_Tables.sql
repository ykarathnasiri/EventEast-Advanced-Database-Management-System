-- Create database
CREATE DATABASE EventEaseDB;
GO

USE EventEaseDB;
GO

-- Create Venue Table
CREATE TABLE Venue (
    VenueID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(200) NOT NULL,
    Capacity INT NOT NULL CHECK (Capacity > 0),
    Contact VARCHAR(100) NULL
);

-- Create Organizer Table
CREATE TABLE Organizer (
    OrganizerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NULL
);

-- Create Event Table
CREATE TABLE Event (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NULL,
    Type VARCHAR(50) NOT NULL CHECK (Type IN ('Concert', 'Meetup', 'Book Launch', 'Conference')),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    VenueID INT NOT NULL,
    OrganizerID INT NOT NULL,
    CONSTRAINT FK_Event_Venue FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    CONSTRAINT FK_Event_Organizer FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
    CONSTRAINT CHK_EndDate CHECK (EndDate >= StartDate)
);

-- Create Attendee Table
CREATE TABLE Attendee (
    AttendeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NULL,
    RegisteredDate DATE NOT NULL DEFAULT GETDATE()
);

-- Create Ticket Table
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    AttendeeID INT NOT NULL,
    TicketType VARCHAR(20) NOT NULL CHECK (TicketType IN ('Regular', 'VIP')),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Booked', 'Available', 'Cancelled')),
    CONSTRAINT FK_Ticket_Event FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CONSTRAINT FK_Ticket_Attendee FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);

-- Create Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT NOT NULL,
    AttendeeID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(500) NULL,
    SubmittedDate DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Feedback_Event FOREIGN KEY (EventID) REFERENCES Event(EventID),
    CONSTRAINT FK_Feedback_Attendee FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);

-- Create Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    TicketID INT NOT NULL,
    PaymentDate DATE NOT NULL DEFAULT GETDATE(),
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    PaymentMethod VARCHAR(20) NOT NULL CHECK (PaymentMethod IN ('Card', 'Cash', 'QR')),
    CONSTRAINT FK_Payment_Ticket FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);

-- Test: Verify table creation
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_CATALOG = 'EventEaseDB' AND TABLE_TYPE = 'BASE TABLE';
GO