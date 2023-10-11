-- Queries On Programming languages database

-- To retrieve a list of all the countries in your database
SELECT * FROM COUNTRY;

-- To retrieve a list of all programming languages along with their creators
SELECT LANGUAGE_NAME, CREATER_NAME FROM LANGUAGE;

-- To retrieve a list of integrated development environments (IDEs) that support a specific language (e.g., Python):
SELECT IDE_NAME, VERSION FROM IDE
WHERE LANGUAGE_ID = (SELECT LANGUAGE_ID FROM LANGUAGE WHERE LANGUAGE_NAME = 'Python';

-- To retrieve a list of frameworks for a specific language
SELECT FRAMEWORK_NAME, RELEASE_DATE FROM FRAMEWORK
WHERE LANGUAGE_ID = (SELECT LANGUAGE_ID FROM LANGUAGE WHERE LANGUAGE_NAME = 'JavaScript');

-- To retrieve a list of libraries available for a specific language
SELECT LIBRARY_NAME, DESCRIPTION FROM LIBRARY
WHERE LANGUAGE_ID = (SELECT LANGUAGE_ID FROM LANGUAGE WHERE LANGUAGE_NAME = 'Python');

-- To retrieve a list of platforms for a specific language
SELECT PLATFORM_NAME, DESCRIPTION FROM PLATFORM
WHERE LANGUAGE_ID = (SELECT LANGUAGE_ID FROM LANGUAGE WHERE LANGUAGE_NAME = 'C++');

--To find all programming languages created before a specific year (e.g., before 2000):
SELECT LANGUAGE_NAME, YEAR_CREATED FROM LANGUAGE
WHERE YEAR_CREATED < 2000;

-- To retrieve the latest versions of all integrated development environments (IDEs)
SELECT IDE_NAME, MAX(VERSION) AS LATEST_VERSION FROM IDE
GROUP BY IDE_NAME;

-- To count how many programming languages are associated with each country:
SELECT COUNTRY_NAME, COUNT(LANGUAGE_ID) AS LANGUAGE_COUNT FROM LANGUAGE
JOIN COUNTRY ON LANGUAGE.COUNTRY_ID = COUNTRY.COUNTRY_ID
GROUP BY COUNTRY_NAME;

-- To find the most popular language paradigm among the languages in your database:
SELECT PARADIGM, COUNT(*) AS LANGUAGE_COUNT FROM LANGUAGE
GROUP BY PARADIGM
ORDER BY LANGUAGE_COUNT DESC
LIMIT 1;

-- To retrieve a list of programming languages and the integrated development environments (IDEs) associated with them:
SELECT L.LANGUAGE_NAME, I.IDE_NAME FROM LANGUAGE AS L
LEFT JOIN IDE AS I ON L.LANGUAGE_ID = I.LANGUAGE_ID
ORDER BY L.LANGUAGE_NAME;

-- To count the number of programming languages that support each language paradigm:
SELECT PARADIGM, COUNT(*) AS LANGUAGE_COUNT FROM LANGUAGE
GROUP BY PARADIGM;

-- To retrieve a list of integrated development environments (IDEs) released after the year 2020:
SELECT IDE_NAME, RELEASE_DATE FROM IDE
WHERE RELEASE_DATE > '2020-12-31';

-- To retrieve a list of frameworks released before the year 2010 that are associated with the JavaScript language:
SELECT FRAMEWORK_NAME, RELEASE_DATE FROM FRAMEWORK
WHERE LANGUAGE_ID = (SELECT LANGUAGE_ID FROM LANGUAGE WHERE LANGUAGE_NAME = 'JavaScript') AND RELEASE_DATE < '2010-01-01';

-- To find all libraries related to the Java language:
SELECT LIBRARY_NAME, DESCRIPTION FROM LIBRARY
WHERE LANGUAGE_ID = 203;

-- To retrieve a list of platforms with the term "Cloud" in their description:
SELECT PLATFORM_NAME, DESCRIPTION FROM PLATFORM 
WHERE DESCRIPTION LIKE '%Cloud%';

-- To count how many programming languages were developed in the United States:
SELECT COUNT(L.LANGUAGE_ID) AS LANGUAGE_COUNT FROM LANGUAGE AS L
JOIN COUNTRY AS C ON L.COUNTRY_ID = C.COUNTRY_ID
WHERE C.COUNTRY_NAME = 'United States';

-- To find integrated development environments (IDEs) that support more than one programming language:
SELECT I.IDE_NAME, COUNT(I.LANGUAGE_ID) AS SUPPORTED_LANGUAGES FROM IDE AS I
GROUP BY I.IDE_NAME
HAVING SUPPORTED_LANGUAGES > 1;

-- To retrieve a list of programming languages and their associated paradigms:
SELECT L.LANGUAGE_NAME, L.PARADIGM
FROM LANGUAGE AS L
ORDER BY L.LANGUAGE_NAME;

-- To find frameworks released in the year 2020 or later:
SELECT FRAMEWORK_NAME, RELEASE_DATE FROM FRAMEWORK
WHERE RELEASE_DATE >= '2020-01-01';
