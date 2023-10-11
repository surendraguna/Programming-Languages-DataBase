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

