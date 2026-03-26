-- Companiile aeriene
CREATE TABLE Companies (
    company_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);

-- Aeroporturile
CREATE TABLE Airports (
    airport_id INT PRIMARY KEY IDENTITY(1,1),
    airport_code CHAR(3) NOT NULL UNIQUE, -- ex: 'OTP', 'LTN'
    city NVARCHAR(100) NOT NULL
);

-- Porțile de îmbarcare
CREATE TABLE Gates (
    gate_id INT PRIMARY KEY IDENTITY(1,1),
    gate_name NVARCHAR(20) NOT NULL
);

CREATE TABLE Routes (
    route_id INT PRIMARY KEY IDENTITY(1,1),
    company_id INT FOREIGN KEY REFERENCES Companies(company_id),
    airport_id INT FOREIGN KEY REFERENCES Airports(airport_id),
    route_type NVARCHAR(50), -- ex: 'International'
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    capacity INT NOT NULL,
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY IDENTITY(1,1),
    route_id INT FOREIGN KEY REFERENCES Routes(route_id),
    gate_id INT FOREIGN KEY REFERENCES Gates(gate_id),
    date DATE NOT NULL,
    flight_nr NVARCHAR(20) NOT NULL,
);

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES Users(user_id),
    flight_id INT FOREIGN KEY REFERENCES Flights(flight_id),
    seat NVARCHAR(10),
    price DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(20) DEFAULT 'Active',
    passenger_first_name NVARCHAR(50) NOT NULL,
    passenger_last_name NVARCHAR(50) NOT NULL,
    passenger_email NVARCHAR(100),
    passenger_phone NVARCHAR(20),
);