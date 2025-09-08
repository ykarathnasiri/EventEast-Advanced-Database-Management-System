USE EventEaseDB;
GO

-- Insert into Venue
INSERT INTO Venue (Name, Location, Capacity, Contact) VALUES
('Colombo Convention Center', 'Colombo, Sri Lanka', 1000, 'contact@ccc.lk'),
('Galle Face Hotel', 'Colombo, Sri Lanka', 500, 'info@gfhotel.lk'),
('BMICH', 'Colombo, Sri Lanka', 1500, 'bmich@bmich.lk'),
('Hilton Colombo', 'Colombo, Sri Lanka', 800, 'hilton@colombo.lk'),
('Shangri-La Colombo', 'Colombo, Sri Lanka', 600, 'shangrila@colombo.lk'),
('Nelum Pokuna', 'Colombo, Sri Lanka', 1200, 'nelum@colombo.lk'),
('Viharamahadevi Park', 'Colombo, Sri Lanka', 2000, NULL),
('Taj Samudra', 'Colombo, Sri Lanka', 700, 'taj@colombo.lk'),
('Cinnamon Grand', 'Colombo, Sri Lanka', 900, 'cinnamon@colombo.lk'),
('Kingsbury Hotel', 'Colombo, Sri Lanka', 400, 'kingsbury@colombo.lk'),
('Jetwing Lighthouse', 'Galle, Sri Lanka', 300, 'jetwing@galle.lk'),
('Heritance Kandalama', 'Dambulla, Sri Lanka', 600, 'heritance@dambulla.lk');

-- Insert into Organizer
INSERT INTO Organizer (Name, Email, Phone) VALUES
('EventMasters', 'eventmasters@gmail.com', '0112345678'),
('CelebrateNow', 'celebrate@now.lk', '0113456789'),
('JoyEvents', 'joyevents@gmail.com', '0114567890'),
('StarPlanners', 'star@planners.lk', '0115678901'),
('EliteEvents', 'elite@events.lk', '0116789012'),
('VibeOrganizers', 'vibe@organizers.lk', '0117890123'),
('DreamEvents', 'dream@events.lk', '0118901234'),
('FestiveCo', 'festive@co.lk', '0119012345'),
('PlanIt', 'planit@gmail.com', '0110123456'),
('EpicEvents', 'epic@events.lk', '0111234567'),
('GalaGurus', 'gala@gurus.lk', '0112345679'),
('SparkleEvents', 'sparkle@events.lk', '0113456780');

-- Insert into Event
INSERT INTO Event (Name, Description, Type, StartDate, EndDate, StartTime, EndTime, VenueID, OrganizerID) VALUES
('Tech Conference 2025', 'Annual tech summit', 'Conference', '2025-06-15', '2025-06-17', '09:00', '17:00', 1, 1),
('Rock Concert', 'Live music performance', 'Concert', '2025-07-10', '2025-07-10', '19:00', '23:00', 2, 2),
('Book Launch: Future', 'New sci-fi novel launch', 'Book Launch', '2025-08-05', '2025-08-05', '18:00', '20:00', 3, 3),
('Startup Meetup', 'Networking for startups', 'Meetup', '2025-09-12', '2025-09-12', '14:00', '17:00', 4, 4),
('Jazz Night', 'Evening of jazz music', 'Concert', '2025-10-20', '2025-10-20', '20:00', '22:00', 5, 5),
('AI Summit', 'AI technology conference', 'Conference', '2025-11-15', '2025-11-16', '09:00', '16:00', 6, 6),
('Poetry Reading', 'Poetry and literature evening', 'Book Launch', '2025-12-01', '2025-12-01', '18:00', '20:00', 7, 7),
('Food Festival', 'Culinary event', 'Meetup', '2025-12-10', '2025-12-12', '10:00', '22:00', 8, 8),
('Charity Concert', 'Fundraising music event', 'Concert', '2026-01-05', '2026-01-05', '19:00', '23:00', 9, 9),
('Tech Meetup', 'Tech enthusiasts gathering', 'Meetup', '2026-02-15', '2026-02-15', '15:00', '18:00', 10, 10),
('Art Exhibition', 'Showcasing local art', 'Meetup', '2026-03-10', '2026-03-12', '10:00', '18:00', 11, 11),
('Gala Dinner', 'Formal dinner event', 'Conference', '2026-04-20', '2026-04-20', '19:00', '22:00', 12, 12);

-- Insert into Attendee
INSERT INTO Attendee (FullName, Email, Phone, RegisteredDate) VALUES
('John Doe', 'john.doe@gmail.com', '0771234567', '2025-05-01'),
('Jane Smith', 'jane.smith@gmail.com', '0772345678', '2025-05-02'),
('Alice Brown', 'alice.brown@gmail.com', '0773456789', '2025-05-03'),
('Bob Wilson', 'bob.wilson@gmail.com', '0774567890', '2025-05-04'),
('Emma Davis', 'emma.davis@gmail.com', '0775678901', '2025-05-05'),
('Liam Johnson', 'liam.johnson@gmail.com', '0776789012', '2025-05-06'),
('Olivia Lee', 'olivia.lee@gmail.com', '0777890123', '2025-05-07'),
('Noah Clark', 'noah.clark@gmail.com', '0778901234', '2025-05-08'),
('Sophia Adams', 'sophia.adams@gmail.com', '0779012345', '2025-05-09'),
('James Taylor', 'james.taylor@gmail.com', '0770123456', '2025-05-10'),
('Mia Harris', 'mia.harris@gmail.com', '0771234568', '2025-05-11'),
('Ethan Moore', 'ethan.moore@gmail.com', '0772345679', '2025-05-12');

-- Insert into Ticket
INSERT INTO Ticket (EventID, AttendeeID, TicketType, Price, Status) VALUES
(1, 1, 'Regular', 50.00, 'Booked'),
(1, 2, 'VIP', 100.00, 'Booked'),
(2, 3, 'Regular', 75.00, 'Booked'),
(2, 4, 'Regular', 75.00, 'Booked'),
(3, 5, 'Regular', 20.00, 'Booked'),
(3, 6, 'Regular', 20.00, 'Booked'),
(4, 7, 'Regular', 30.00, 'Booked'),
(4, 8, 'Regular', 30.00, 'Booked'),
(5, 9, 'VIP', 150.00, 'Booked'),
(5, 10, 'Regular', 80.00, 'Booked'),
(6, 11, 'Regular', 60.00, 'Booked'),
(6, 12, 'VIP', 120.00, 'Booked');

-- Insert into Feedback
INSERT INTO Feedback (EventID, AttendeeID, Rating, Comment, SubmittedDate) VALUES
(1, 1, 4, 'Great event, good speakers', '2025-06-18'),
(1, 2, 5, 'Amazing experience!', '2025-06-18'),
(2, 3, 3, 'Sound quality could be better', '2025-07-11'),
(2, 4, 4, 'Enjoyed the concert', '2025-07-11'),
(3, 5, 5, 'Loved the book launch', '2025-08-06'),
(3, 6, 4, 'Interesting event', '2025-08-06'),
(4, 7, 4, 'Good networking', '2025-09-13'),
(4, 8, 3, 'More sessions needed', '2025-09-13'),
(5, 9, 5, 'Fantastic jazz night', '2025-10-21'),
(5, 10, 4, 'Great atmosphere', '2025-10-21'),
(6, 11, 4, 'Informative summit', '2025-11-17'),
(6, 12, 5, 'Well organized', '2025-11-17');

-- Insert into Payment
INSERT INTO Payment (TicketID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2025-05-01', 50.00, 'Card'),
(2, '2025-05-02', 100.00, 'Card'),
(3, '2025-05-03', 75.00, 'QR'),
(4, '2025-05-04', 75.00, 'Cash'),
(5, '2025-05-05', 20.00, 'Card'),
(6, '2025-05-06', 20.00, 'QR'),
(7, '2025-05-07', 30.00, 'Card'),
(8, '2025-05-08', 30.00, 'Cash'),
(9, '2025-05-09', 150.00, 'Card'),
(10, '2025-05-10', 80.00, 'QR'),
(11, '2025-05-11', 60.00, 'Card'),
(12, '2025-05-12', 120.00, 'Card');

-- Test: Verify data insertion
SELECT 'Venue' AS TableName, COUNT(*) AS RecordCount FROM Venue
UNION
SELECT 'Organizer', COUNT(*) FROM Organizer
UNION
SELECT 'Event', COUNT(*) FROM Event
UNION
SELECT 'Attendee', COUNT(*) FROM Attendee
UNION
SELECT 'Ticket', COUNT(*) FROM Ticket
UNION
SELECT 'Feedback', COUNT(*) FROM Feedback
UNION
SELECT 'Payment', COUNT(*) FROM Payment;
GO