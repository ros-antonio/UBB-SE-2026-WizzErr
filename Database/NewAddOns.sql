CREATE TABLE Tickets_AddOns (
    ticket_id INT NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
    addon_id INT NOT NULL FOREIGN KEY REFERENCES AddOns(addon_id),
    PRIMARY KEY (ticket_id, addon_id)
);

CREATE TABLE Memberships_AddOns_Discounts (
    membership_id INT NOT NULL FOREIGN KEY REFERENCES Memberships(membership_id),
    addon_id INT NOT NULL FOREIGN KEY REFERENCES AddOns(addon_id),
    discount_percentage DECIMAL(5, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (membership_id, addon_id)
);