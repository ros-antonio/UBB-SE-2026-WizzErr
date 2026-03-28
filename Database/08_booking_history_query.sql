SELECT 
    t.passenger_first_name + ' ' + t.passenger_last_name AS PassengerName,
    f.flight_number AS FlightNumber,
    a.city AS DestinationCity,
    a.name AS AirportName,
    g.name AS GateName,
    f.date AS DepartureDate,
    t.seat AS SeatNumber,
    t.status AS BookingStatus
FROM Users u
JOIN Tickets t ON u.user_id = t.user_id
JOIN Flights f ON t.flight_id = f.id
JOIN Gates g ON f.gate_id = g.id
JOIN Routes r ON f.route_id = r.id
JOIN Airports a ON r.airport_id = a.id
WHERE u.user_id = 1;

GO