CREATE DATABASE PROGRAMMING

CREATE TABLE COUNTRY
(
    COUNTRY_ID 		INT 		PRIMARY KEY,
    COUNTRY_NAME 	VARCHAR(50) 	NOT NULL
);

CREATE TABLE LANGUAGE 
(
    LANGUAGE_ID   INT 		PRIMARY KEY,
    LANGUAGE_NAME VARCHAR(50)	UNIQUE NOT NULL,
    CREATER_NAME  VARCHAR(55) 	NOT NULL,
    COUNTRY_ID 	  INT 		FOREIGN KEY REFERENCES COUNTRY(COUNTRY_ID) NOT NULL,
    YEAR_CREATED  INT 		NOT NULL,
    PARADIGM 	  VARCHAR(50) 	NOT NULL,
    WEBSITE 	  VARCHAR(99) 	NOT NULL
);

CREATE TABLE IDE 
(
    IDE_ID 		INT 		PRIMARY KEY,
    IDE_NAME 		VARCHAR(40)	NOT NULL,
    LANGUAGE_ID 	INT 		FOREIGN KEY REFERENCES LANGUAGE(LANGUAGE_ID) NOT NULL,
    RELEASE_DATE	DATE 		NOT NULL,
    VERSION 		VARCHAR(30) 	NOT NULL
);

CREATE TABLE FRAMEWORK 
(
    FRAMEWORK_ID 	INT 		PRIMARY KEY,
    FRAMEWORK_NAME  	VARCHAR(30) UNIQUE NOT NULL,
    LANGUAGE_ID 	INT 		FOREIGN KEY REFERENCES LANGUAGE(LANGUAGE_ID) NOT NULL,
    RELEASE_DATE	DATE		NOT NULL
);

CREATE TABLE LIBRARY 
(
    LIBRARY_ID 	 INT 		 PRIMARY KEY,
    LIBRARY_NAME VARCHAR(30) 	 UNIQUE	NOT NULL,
    DESCRIPTION  VARCHAR(50) 	 NOT NULL,
    LANGUAGE_ID  INT 		 FOREIGN KEY REFERENCES LANGUAGE(LANGUAGE_ID) NOT NULL
);

CREATE TABLE PLATFORM 
(
    PLATFORM_ID 	INT 		PRIMARY KEY,
    PLATFORM_NAME	VARCHAR(30) UNIQUE NOT NULL,
    DESCRIPTION 	VARCHAR(80) NOT NULL,
    LANGUAGE_ID 	INT 		FOREIGN KEY REFERENCES LANGUAGE(LANGUAGE_ID) NOT NULL
);

SELECT * FROM COUNTRY	
SELECT * FROM LANGUAGE
SELECT * FROM IDE
SELECT * FROM FRAMEWORK
SELECT * FROM LIBRABRY
SELECT * FROM PLATFORM
