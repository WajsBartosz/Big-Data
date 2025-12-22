SELECT Developer, COUNT(*) AS `NumberofGames` FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY Developer
ORDER BY `NumberofGames` DESC