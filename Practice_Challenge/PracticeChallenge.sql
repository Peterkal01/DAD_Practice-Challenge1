/*Peter Kalogerakis 102577988*/


/*Tour (TourName, Descr1iption)
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


