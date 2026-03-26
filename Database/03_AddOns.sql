CREATE TABLE AddOns (
    addon_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL
);
