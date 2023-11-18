--------------------------------------
---                                ---
--- Author: TJ Pataria             ---
--- License: N/A                   ---
--- Date: Nov 17, 2023             ---
--- Version: 1.0                   ---
---                                ---
--------------------------------------

----------------------- General Rules: -----------------------
--- 1. Use snake_case instead of camelCase
--- 2. Table names should be plural
--- 3. Use and spell out id fields (user_id instead of just 'id')
--- 4. Don't use ambiguous column names
--- 5. Make sure the foreign_key columns are the same as what they refer to




CREATE SCHEMA IF NOT EXISTS allstarfinancial;

SET TIME_ZONE = 'SYSTEM';

USE allstarfinancial;

DROP TABLE IF EXISTS Users;

CREATE TABLE Users
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    password        VARCHAR(255) DEFAULT NULL,
    address         VARCHAR(255) DEFAULT NULL,
    phone           VARCHAR(30) DEFAULT NULL,
    title           VARCHAR(50) DEFAULT NULL,
    bio             VARCHAR(255) DEFAULT NULL,
    user_active     BOOLEAN DEFAULT FALSE,
    user_unlocked   BOOLEAN DEFAULT TRUE,
    created_ts      DATETIME DEFAULT CURRENT_TIMESTAMP,
    using_tfa       BOOLEAN DEFAULT FALSE,
    image_url       VARCHAR(255) DEFAULT 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
    CONSTRAINT UQ_Users_Email UNIQUE (email)
);

DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    role_name            VARCHAR(50) NOT NULL,
    permission      VARCHAR(255) NOT NULL, -- user:read, user:delete, customer:read
    CONSTRAINT UQ_Roles_Role_Name UNIQUE (role_name)
);

DROP TABLE IF EXISTS UserRoles;

CREATE TABLE UserRoles
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id         BIGINT UNSIGNED NOT NULL,
    role_id         BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES Roles (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT UQ_UserRoles_User_Id UNIQUE (user_id)
);

DROP TABLE IF EXISTS Events;

CREATE TABLE Events
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    event_type      VARCHAR(50) NOT NULL CHECK(event_type IN('LOGIN_ATTEMPT', 'LOGIN_FAILURE', 'LOGIN_SUCCESS', 'PROFILE_UPDATE', 'PROFILE_PICTURE_UPDATE', 'ROLE_UPDATE', 'ACCOUNT_SETTINGS_UPDATE', 'PASSWORD_UPDATE', '2FA_UPDATE')),
    description     VARCHAR(255) NOT NULL,
    CONSTRAINT UQ_Events_Event_Type UNIQUE (event_type)
);

DROP TABLE IF EXISTS UserEvents;

CREATE TABLE UserEvents
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id         BIGINT UNSIGNED NOT NULL,
    event_id        BIGINT UNSIGNED NOT NULL,
    device          VARCHAR(100) DEFAULT NULL,
    ip_address      VARCHAR(100) DEFAULT NULL,
    created_ts      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES Events (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS AccountVerifications;

CREATE TABLE AccountVerifications
(
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id         BIGINT UNSIGNED NOT NULL,
    url             VARCHAR(255) NOT NULL,
    -- veri_date       DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_AccountVerifications_User_Id UNIQUE (user_id),
    CONSTRAINT UQ_AccountVerifications_Url UNIQUE (url)
);

DROP TABLE IF EXISTS ResetPasswordVerifications;

CREATE TABLE ResetPasswordVerifications
(
    id                  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id             BIGINT UNSIGNED NOT NULL,
    url                 VARCHAR(255) NOT NULL,
    expiration_date     DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_ResetPasswordVerifications_User_Id UNIQUE (user_id),
    CONSTRAINT UQ_ResetPasswordVerifications_Url UNIQUE (url)
);

DROP TABLE IF EXISTS TwoFactorVerifications;

CREATE TABLE TwoFactorVerifications
(
    id                  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id             BIGINT UNSIGNED NOT NULL,
    veri_code           VARCHAR(10) NOT NULL,
    expiration_date     DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_TwoFactorVerifications_User_Id UNIQUE (user_id),
    CONSTRAINT UQ_TwoFactorVerifications_Veri_Code UNIQUE (veri_code)
);





























