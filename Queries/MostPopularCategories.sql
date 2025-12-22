SELECT c.description AS Category, COUNT(*) AS NumberOfGames FROM `SteamGamesData.GamesDataFromSteamAPI`, UNNEST(Categories) AS c
GROUP BY Category
ORDER BY NumberOfGames DESC