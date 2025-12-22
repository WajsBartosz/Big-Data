SELECT Name, ARRAY_LENGTH(Categories) AS CategoryCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
ORDER BY CategoryCount DESC
LIMIT 20