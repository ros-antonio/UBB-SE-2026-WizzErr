-- DROP EXISTING TABLES

DROP TABLE IF EXISTS Memberships_AddOns_Discounts;
DROP TABLE IF EXISTS Tickets_AddOns;
DROP TABLE IF EXISTS Tickets;
DROP TABLE IF EXISTS Flights;
DROP TABLE IF EXISTS Routes;
DROP TABLE IF EXISTS Gates;
DROP TABLE IF EXISTS Airports;
DROP TABLE IF EXISTS Companies;
DROP TABLE IF EXISTS AddOns;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Memberships;
GO

-- CREATE TABLES

CREATE TABLE Memberships (
    membership_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    flight_discount_percentage TINYINT NOT NULL DEFAULT 0 CHECK (flight_discount_percentage <= 100)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    email NVARCHAR(100) NOT NULL UNIQUE,
    phone NVARCHAR(20),
    username NVARCHAR(50) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    membership_id INT FOREIGN KEY REFERENCES Memberships(membership_id)
);

CREATE TABLE AddOns (
    addon_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL UNIQUE,
    base_price DECIMAL(10, 2) NOT NULL CHECK (base_price >= 0)
);


-- ===== START ===== TABLES FROM THE AIRPORT MANAGER TEAM  
CREATE TABLE Companies(
    id int IDENTITY(1,1) PRIMARY KEY,
    name varchar(20)
);

CREATE TABLE Airports(
    id int IDENTITY(1,1) PRIMARY KEY,
    city varchar(30),
    name VARCHAR(100),
    code VARCHAR(10)
);

CREATE TABLE Gates(
    id int IDENTITY(1,1) PRIMARY KEY,
    name varchar(20)
);

CREATE TABLE Routes(
    id int IDENTITY(1,1) PRIMARY KEY,
    company_id int FOREIGN KEY REFERENCES Companies(id),
    route_type varchar(10),
    airport_id int FOREIGN KEY REFERENCES Airports(id),
    reccurence_interval int,
    start_date date,
    end_date date,
    departure_time datetime,
    arrival_time datetime,
    capacity int
);

CREATE TABLE Flights(
    id int IDENTITY(1,1) PRIMARY KEY,
    route_id int FOREIGN KEY REFERENCES Routes(id),
    date datetime,
    runway_id int,
    gate_id int FOREIGN KEY REFERENCES Gates(id),
    flight_number varchar(50)
);

-- ===== END ===== TABLES FROM THE AIRPORT MANAGER TEAM

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL FOREIGN KEY REFERENCES Users(user_id),
    flight_id INT NOT NULL FOREIGN KEY REFERENCES Flights(id),
    seat NVARCHAR(10),
    price DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(20) DEFAULT 'Active',
    passenger_first_name NVARCHAR(50) NOT NULL,
    passenger_last_name NVARCHAR(50) NOT NULL,
    passenger_email NVARCHAR(100),
    passenger_phone NVARCHAR(20)
);

CREATE TABLE Tickets_AddOns (
    ticket_id INT NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
    addon_id INT NOT NULL FOREIGN KEY REFERENCES AddOns(addon_id),
    PRIMARY KEY (ticket_id, addon_id)
);

CREATE TABLE Memberships_AddOns_Discounts (
    membership_id INT NOT NULL FOREIGN KEY REFERENCES Memberships(membership_id),
    addon_id INT NOT NULL FOREIGN KEY REFERENCES AddOns(addon_id),
    discount_percentage TINYINT NOT NULL DEFAULT 0 CHECK (discount_percentage <= 100),
    PRIMARY KEY (membership_id, addon_id)
);

-- SEED TABLES

-- ===== START ===== TABLES FROM THE AIRPORT MANAGER TEAM  
INSERT INTO Companies(name) VALUES
('WizzAir'),
('Lufthansa');
GO

INSERT INTO Airports(city, name, code) VALUES
('London', 'London Luton Airport', 'LTN'),
('Munich', 'Munich Airport', 'MUC'),
('Cluj-Napoca', 'Cluj International Airport', 'CLJ');
GO

INSERT INTO Gates(name) VALUES
('Gate 1'),
('Gate 2'),
('Gate 3'),
('Gate 4');
GO

INSERT INTO Routes(
    company_id,
    route_type,
    airport_id,
    reccurence_interval,
    start_date,
    end_date,
    departure_time,
    arrival_time,
    capacity
)
VALUES
(1, 'DEP', 1, 1, '2026-03-01', '2026-12-31', '1900-01-01 08:30:00', '1900-01-01 10:45:00', 180),
(1, 'ARR', 1, 1, '2026-03-01', '2026-12-31', '1900-01-01 11:30:00', '1900-01-01 13:40:00', 180),
(2, 'DEP', 2, 2, '2026-03-01', '2026-12-31', '1900-01-01 14:00:00', '1900-01-01 15:20:00', 160),
(2, 'ARR', 2, 2, '2026-03-01', '2026-12-31', '1900-01-01 16:00:00', '1900-01-01 17:25:00', 160);
GO

INSERT INTO Flights(route_id, date, runway_id, gate_id, flight_number) VALUES
-- April
(1, '2026-04-10 08:30:00', 1, 1, 'W6 3401'),
(2, '2026-04-15 13:40:00', 2, 2, 'W6 3402'),
(3, '2026-04-20 14:00:00', 3, 3, 'LH 1671'),
-- May
(4, '2026-05-05 17:25:00', 1, 4, 'LH 1672'),
(1, '2026-05-18 08:30:00', 2, 1, 'W6 3401'),
(2, '2026-05-28 13:40:00', 3, 2, 'W6 3402'),
-- June
(1, '2026-06-10 08:30:00', 1, 2, 'W6 3401'),
(2, '2026-06-15 13:40:00', 2, 3, 'W6 3402'),
(3, '2026-06-25 14:00:00', 1, 4, 'LH 1671'),
-- July
(4, '2026-07-04 17:25:00', 2, 1, 'LH 1672'),
(1, '2026-07-16 08:30:00', 3, 1, 'W6 3401'),
(2, '2026-07-29 13:40:00', 1, 2, 'W6 3402'),
-- August
(1, '2026-08-12 08:30:00', 2, 3, 'W6 3401'),
(3, '2026-08-22 14:00:00', 3, 4, 'LH 1671'),
-- September
(2, '2026-09-08 13:40:00', 1, 1, 'W6 3402'),
(4, '2026-09-18 17:25:00', 2, 2, 'LH 1672'),
-- October
(1, '2026-10-05 08:30:00', 1, 1, 'W6 3401'),
(3, '2026-10-20 14:00:00', 2, 3, 'LH 1671'),
-- November
(4, '2026-11-12 17:25:00', 3, 4, 'LH 1672'),
(2, '2026-11-25 13:40:00', 1, 2, 'W6 3402'),
-- December
(1, '2026-12-10 08:30:00', 2, 2, 'W6 3401'),
(3, '2026-12-20 14:00:00', 3, 3, 'LH 1671'),
(4, '2026-12-30 17:25:00', 1, 4, 'LH 1672');
GO

-- ===== END ===== TABLES FROM THE AIRPORT MANAGER TEAM  

INSERT INTO Memberships (name, flight_discount_percentage) 
VALUES 
    ('Bronze', 5),
    ('Silver', 10),
    ('Gold', 15);
GO

INSERT INTO AddOns (name, base_price) 
VALUES 
    ('Extra Baggage 20kg', 50.00), 
    ('Priority Boarding', 15.00),  
    ('Lounge Access', 40.00),      
    ('Cabin Baggage 10kg', 25.00); 
GO

INSERT INTO Memberships_AddOns_Discounts (membership_id, addon_id, discount_percentage) 
VALUES 
    (1, 1, 5),
    (1, 2, 10),
    (1, 3, 5),
    (1, 4, 10),
    (2, 1, 10),
    (2, 2, 35),
    (2, 3, 20),
    (2, 4, 50),
    (3, 1, 25),
    (3, 2, 100),
    (3, 3, 50),
    (3, 4, 100);
GO