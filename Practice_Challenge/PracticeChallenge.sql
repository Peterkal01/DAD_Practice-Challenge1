/*Peter Kalogerakis 102577988*/


/*Tour (TourName, Description)
PK (TourName)

Event (EventYear, EventMonth, EventDay, Fee)
PK (TourName, EventYear, EventMonth, EventDay)
FR (TourName) references Tour


Client (ClientID, Surname, GivenName, Gender)
PK (ClientID)

Booking (ClientID, TourName, EventMonth, EventDay, EventYear,DateBooked, Payment)
PK (ClientID, TourName, EventMonth, EventDay, EventYear)
FK (ClientID) references Client */


DROP TABLE IF EXISTS dbo.Booking
DROP TABLE IF EXISTS dbo.Event
DROP TABLE IF EXISTS dbo.Client
DROP TABLE IF EXISTS dbo.Tour

CREATE TABLE dbo.Tour (
    TourName NVARCHAR(100),
    Description NVARCHAR(100),
    PRIMARY KEY (TourName)
);

CREATE TABLE dbo.Client (
    ClientID int,
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(1),
    PRIMARY KEY (ClientID)
);

CREATE TABLE dbo.Event (
    TourName NVARCHAR(100),
    EventMonth NVARCHAR(3),
    EventDay int,
    EventYear int,
    Fee Money
    PRIMARY KEY (TourName, EventDay, EventMonth, EventYear)
);

CREATE TABLE dbo.Booking (
    ClientID int,
    TourName NVARCHAR(100),
    EventMonth NVARCHAR(3),
    EventDay int,
    EventYear int,
    Payment money,
    DateBooked DATE NOT NULL,
    PRIMARY KEY (ClientID, TourName, EventDay, EventMonth, EventYear),
    FOREIGN KEY (ClientID) REFERENCES Client,
    FOREIGN Key (TourName, EventDay, EventMonth, EventYear) REFERENCES Event
);

DELETE dbo.Booking
DELETE dbo.Event
DELETE dbo.Client
DELETE dbo.Tour

INSERT INTO dbo.Tour (TourName, Description)
VALUES ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of Coles'),
('East', 'Tour of Dan Murphys');


INSERT INTO dbo.Client (ClientID, Surname, GivenName, Gender)
VALUES (1, 'Price', 'Taylor', 'M'),
(2, 'Smith', 'John', 'F'),
(3, 'Le', 'Brandon', 'M'),
(102577988, 'Kalogerakis', 'Peter', 'M');


INSERT INTO dbo.Event (TourName, EventMonth, EventDay, EventYear, Fee)
VALUES ('North', 'Jan', 9, 2016, 200),
('South', 'Feb', 6, 2016, 300),
('East', 'Mar', 3, 2016, 400),
('West', 'Apr', 1, 2016, 500);

INSERT INTO dbo.Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (1, 'North',	'Jan', 9, 2016,	200, '2015/12/10'),
(2, 'South', 'Feb', 6, 2016, 300, '2015/11/9'),
(3, 'West', 'Apr', 1, 2016, 500, '2015/9/7'),
(102577988, 'East',	'Mar', 3, 2016,	400, '2015/10/8');