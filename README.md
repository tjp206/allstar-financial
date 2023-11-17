# allstar-financial

### Tech Stack:
   - Back-end:
     - Java 17
     
   - Front-end:
     - Angular

   - Database:
     - MySQL 
     
---------------------------------------------------------------------------------

### Application Requirements:

### User
#### 1. New User Account(unique email address)
   - Verify email (account verification)
   - Add user profile image
   - Be able to update user detail information
   - User details (name, email, position, bio, phone number, address, etc)
   
#### 2. User Password Reset (while logged out)
   - Password reset link should have expiry date (24 hours or less)

#### 3. User Login (use email and password)
   - Token based authentication (JWT Token)
   - Be able to seamlessly refresh Token

#### 4. Mitigate against potential brute force attacks
   - Lock account after X number of logins (5x?) 

#### 5. Role/permission based app access
   - Protect application resources using roles and permissions

#### 6. 2FA (phone number?)
   - Send verification code to users phone

#### 7. Track user activities (logins, account changes, etc)
   - Ability to report suspicious activity
   - Tracking information:
     - IP Address
     - Device
     - Browser
     - Date
     - Type

### Customer
#### 1. Customer Information
   - Manage customer information(name, address, etc)
   - Can be individual or institution
   - Should have status (active, inactive, etc)
   - Customer will have invoices
   - Be able to print customers to spreadsheet

#### 2. Search Customer
   - Be able to search by name
   - Pagination

### Invoicing
#### 1. Manage Invoices
   - Create new invoices
   - Add invoices to a customer
   - Print invoices for mailing
   - Be able to print invoices to spreadsheet
   - Download invoices as PDF