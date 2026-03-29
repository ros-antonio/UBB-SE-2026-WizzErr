# Local Database Configuration

This project requires a local `appsettings.json` file to configure the database connection. For security reasons, this file is ignored by Git to prevent accidentally pushing local credentials to the repository.

## Setup Instructions

1. **Create the configuration file:**
   - Locate the `appsettings.example.json` file in the root of the `TicketManager` project.
   - Make a copy of this file in the same directory.
   - Rename the copied file to `appsettings.json`.

2. **Update the connection string:**
   - Open your new `appsettings.json` file.
   - Find the `ConnectionStrings:DefaultConnection` setting:
     ```json
     "DefaultConnection": "Server=YOUR_SERVER_NAME;Database=TicketsDB;Trusted_Connection=True;TrustServerCertificate=True;"
     ```
   - Replace `YOUR_SERVER_NAME` with the name of your local Microsoft SQL Server instance.
  
*Note: Your `appsettings.json` will not be tracked by Git, so your local database configurations will remain private.*
