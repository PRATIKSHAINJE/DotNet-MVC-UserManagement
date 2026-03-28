# ASP.NET MVC User Management System

## Overview
This project is an ASP.NET MVC application that implements a complete User Management System with role-based access and database integration.

## Features
- User Registration with validation
- Email Verification using token
- Login with role-based access (Admin/User)
- Admin dashboard to Enable/Disable users
- User details view after login
- Fetch user data using AJAX
- Clean MVC architecture

## Modules

### 1. User Module
- Registration with Name, Email, Password, Language, Mobile
- Email validation and password rules
- Verification link generation
- Login only after verification

### 2. Admin Module
- Admin login (pre-created in DB)
- View all users
- Enable/Disable users

### 3. Fetch Module
- User enters email
- AJAX call to controller
- Displays Name, Username, Language, Mobile

## Technologies Used
- ASP.NET MVC (.NET Framework)
- C#
- SQL Server
- ADO.NET
- Bootstrap
- jQuery (AJAX)

## Database Setup
1. Open SQL Server
2. Run `database.sql`
3. Update connection string in Web.config

## How to Run
1. Open solution in Visual Studio
2. Restore NuGet packages
3. Run the project

## Notes
- This project is implemented using MVC controllers (without Web API)
- API-based architecture can also be implemented if needed

## Author
Pratiksha Inje
