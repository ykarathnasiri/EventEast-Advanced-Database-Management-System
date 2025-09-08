# EventEase Advanced Database Management System

[![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red)](https://www.microsoft.com/en-us/sql-server)
[![Flask](https://img.shields.io/badge/Framework-Flask-blue)](https://flask.palletsprojects.com/)
[![Python](https://img.shields.io/badge/Language-Python-green)](https://www.python.org/)

A comprehensive event management database system designed for efficient organization, ticketing, and feedback analysis. Built with Microsoft SQL Server and featuring a Flask web application interface.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Database Design](#database-design)
- [Installation](#installation)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [API Documentation](#api-documentation)
- [Business Intelligence](#business-intelligence)
- [Contributors](#contributors)
- [License](#license)

## 🎯 Overview

EventEase is a robust database management system developed for **I O N Groups Pvt Ltd** to handle various types of events including concerts, conferences, meetups, and book launches. The system provides comprehensive data management capabilities with advanced SQL features and a user-friendly web interface.

### Key Capabilities
- **Event Management**: Complete lifecycle management from creation to completion
- **Venue Management**: Capacity tracking and venue information management
- **Ticketing System**: Automated ticket booking with real-time capacity updates
- **Feedback Analysis**: Comprehensive attendee satisfaction tracking
- **Revenue Tracking**: Real-time financial reporting and analytics
- **Data Integrity**: Advanced triggers and constraints ensure data consistency

## ✨ Features

### Database Features
- **Normalized Design**: Third Normal Form (3NF) compliance for optimal data integrity
- **Advanced Triggers**: Automated capacity management and audit trails
- **User-Defined Functions**: Reusable calculations for revenue, attendance, and ratings
- **Views**: Simplified data access for complex joins and reporting
- **Stored Procedures**: Encapsulated business logic with validation

### Web Application Features
- **Event Browsing**: Interactive event listing with detailed information
- **Event Filtering**: Filter events by type, date, and other criteria
- **Responsive Design**: Modern web interface built with Flask
- **Real-time Data**: Direct database integration for up-to-date information

### Business Intelligence
- **Event Popularity Reports**: Analyze attendance and engagement metrics
- **Revenue Analytics**: Track sales performance across events
- **Satisfaction Analysis**: Monitor attendee feedback and ratings

## 🏗️ Database Design

### Entity-Relationship Model

The system is built around the following core entities:

- **Venue**: Physical locations hosting events
- **Organizer**: Event management personnel
- **Event**: Individual events with scheduling and details
- **Attendee**: Event participants and their information
- **Ticket**: Booking records linking attendees to events
- **Feedback**: Attendee reviews and ratings
- **Payment**: Transaction records for ticket purchases

### Key Relationships
- Venue → Event (1:M)
- Organizer → Event (1:M)
- Event → Ticket (1:M)
- Attendee → Ticket (1:M)
- Ticket → Payment (1:1)
- Attendee ↔ Event (M:N via Feedback)

## 🚀 Installation

### Prerequisites
- Microsoft SQL Server 2019 or later
- SQL Server Management Studio (SSMS)
- Python 3.8+
- Flask framework

### Database Setup

1. **Create the Database**
   ```sql
   CREATE DATABASE EventEaseDB;
   USE EventEaseDB;
   ```

2. **Run the Schema Script**
   Execute the provided SQL scripts in the following order:
   - `01_create_tables.sql`
   - `02_insert_sample_data.sql`
   - `03_create_triggers.sql`
   - `04_create_functions.sql`
   - `05_create_views.sql`
   - `06_create_procedures.sql`

### Web Application Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/eventease-db-system.git
   cd eventease-db-system
   ```

2. **Install Dependencies**
   ```bash
   pip install flask pyodbc
   ```

3. **Configure Database Connection**
   Update the connection string in `app.py`:
   ```python
   connection_string = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=your_server;DATABASE=EventEaseDB;Trusted_Connection=yes;"
   ```

4. **Run the Application**
   ```bash
   python app.py
   ```

## 💻 Usage

### Web Interface

Access the web application at `http://localhost:5000` to:
- Browse available events
- Filter events by type (Concert, Conference, Meetup, Book Launch)
- View event details including venue and organizer information

### Database Operations

#### Key Stored Procedures

**Insert New Event**
```sql
EXEC InsertEvent 
    @VenueID = 1,
    @OrganizerID = 1,
    @Name = 'Tech Conference 2024',
    @Description = 'Annual technology conference',
    @TypeID = 4,
    @StartDate = '2024-06-15',
    @EndDate = '2024-06-15',
    @StartTime = '09:00:00',
    @EndTime = '17:00:00';
```

**Generate Sales Report**
```sql
EXEC TicketSalesReport;
```

#### Useful Functions

**Get Event Revenue**
```sql
SELECT dbo.GetTotalRevenue(1) AS TotalRevenue;
```

**Get Attendee Count**
```sql
SELECT dbo.GetAttendeeCount(1) AS AttendeeCount;
```

**Get Average Rating**
```sql
SELECT dbo.GetAverageRating(1) AS AverageRating;
```

## 📊 Database Schema

### Core Tables

| Table | Purpose | Key Fields |
|-------|---------|------------|
| `Event` | Event information | EventID, Name, Description, TypeID |
| `Venue` | Venue details | VenueID, Name, Location, Capacity |
| `Attendee` | User information | AttendeeID, FullName, Email |
| `Ticket` | Booking records | TicketID, EventID, AttendeeID, Price |
| `Feedback` | Reviews and ratings | FeedbackID, EventID, AttendeeID, Rate |
| `Payment` | Transaction records | PaymentID, TicketID, Amount, PaymentDate |

### Lookup Tables
- `EventType`: Event categories
- `TicketStatus`: Booking status tracking

### Contact Tables
- `VenueContact`: Venue phone numbers
- `OrganizerContact`: Organizer contact details
- `Phone`: Attendee contact information

## 📈 Business Intelligence

### Available Reports

1. **Event Popularity Analysis**
   - Tracks ticket sales and attendance by event
   - Identifies high-performing events and venues

2. **Revenue Analytics**
   - Comprehensive financial reporting
   - Revenue tracking by event, venue, and time period

3. **Attendee Satisfaction**
   - Feedback analysis and rating summaries
   - Identifies areas for improvement

### Sample BI Queries

```sql
-- Event Popularity Report
SELECT 
    e.Name AS EventName,
    et.TypeName,
    v.Name AS Venue,
    COUNT(t.TicketID) AS TicketsSold,
    dbo.GetAttendeeCount(e.EventID) AS AttendeeCount
FROM Event e
JOIN EventType et ON e.TypeID = et.TypeID
JOIN Venue v ON e.VenueID = v.VenueID
LEFT JOIN Ticket t ON e.EventID = t.EventID AND t.TicketStatusID = 2
GROUP BY e.EventID, e.Name, et.TypeName, v.Name
ORDER BY TicketsSold DESC;
```

## 🔧 Advanced Features

### Triggers
- **UpdateVenueCapacity**: Automatically updates venue capacity when tickets are booked
- **AuditFeedback**: Creates audit trail for feedback entries
- **PreventEventDeletion**: Prevents deletion of events with active bookings

### Views
- **EventDetails**: Consolidated event information with venue and organizer details
- **AttendeeTickets**: Complete ticket information with attendee details
- **EventFeedbackSummary**: Aggregated feedback statistics per event

## 👥 Contributors

- **Kevin Anjalo** - BSc (Honours) in Computer Science
- **Navindu Ashen** - BSc (Honours) in Data Science

*Project developed for I O N Groups Pvt Ltd*

## 📝 License

This project is developed as part of an academic assignment. Please refer to your institution's guidelines for usage and distribution.

## 📞 Support

For technical support or questions about the EventEase system:

1. Check the documentation in the `/docs` folder
2. Review the SQL scripts for implementation details
3. Refer to the technical report for comprehensive system analysis

## 🔗 Additional Resources

- [Microsoft SQL Server Documentation](https://learn.microsoft.com/en-us/sql/sql-server)
- [Flask Framework Documentation](https://flask.palletsprojects.com/)
- [Database Normalization Guide](https://www.ibm.com/docs/en/db2-for-zos/12.0.0?topic=modeling-normalization-in-database-design)

---

**Note**: This system includes comprehensive sample data for testing and demonstration purposes. The database backup file (.bak) and complete source code are available in the project repository.
