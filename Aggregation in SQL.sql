USE world;

#Q.1. Count how many cities are there in each country
SELECT c.Name AS CountryName, COUNT(ci.ID) AS TotalCities
FROM Country c
LEFT JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name;

#Q.2. Display all continents having more than 30 countries
SELECT Continent, COUNT(*) AS TotalCountries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;

#Q.3. List regions whose total population exceeds 200 million
SELECT Region, SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

#Q.4. Top 5 continents by average GNP per country
SELECT Continent, AVG(GNP) AS AvgGNP
FROM Country
GROUP BY Continent
ORDER BY AvgGNP DESC
LIMIT 5;

#Q.5. Total number of official languages spoken in each continent
SELECT c.Continent, COUNT(cl.Language) AS OfficialLanguages
FROM Country c
JOIN CountryLanguage cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

#Q.6. Maximum and minimum GNP for each continent
SELECT Continent,
       MAX(GNP) AS MaxGNP,
       MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent;

#Q.7. Country with the highest average city population
SELECT c.Name AS CountryName,
       AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

#Q.8. Continents where average city population > 200,000
SELECT c.Continent,
       AVG(ci.Population) AS AvgCityPopulation
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

#Q.9. Total population and average life expectancy per continent (order by avg life expectancy desc)

SELECT Continent,
       SUM(Population) AS TotalPopulation,
       AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;

#Q.10. Top 3 continents with highest avg life expectancy (only if total population > 200 million)
SELECT Continent,
       AVG(LifeExpectancy) AS AvgLifeExpectancy,
       SUM(Population) AS TotalPopulation
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;


