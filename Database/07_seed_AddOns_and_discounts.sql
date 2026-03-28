INSERT INTO AddOns (name, base_price) 
VALUES 
    ('Extra Baggage 20kg', 50.00), 
    ('Priority Boarding', 15.00),  
    ('Lounge Access', 40.00),      
    ('Cabin Baggage 10kg', 25.00); 
GO


INSERT INTO Memberships_AddOns_Discounts (membership_id, addon_id, discount_percentage) 
VALUES 
    (1, 1, 5),  (1, 2, 10), (1, 3, 5),  (1, 4, 10),

    (2, 1, 10), (2, 2, 35), (2, 3, 20), (2, 4, 50),

    (3, 1, 25), (3, 2, 100), (3, 3, 50), (3, 4, 100);
GO