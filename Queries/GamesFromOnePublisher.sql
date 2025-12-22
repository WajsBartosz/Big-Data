SELECT Publisher, COUNT(*) AS `NumberofGames` FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY Publisher
ORDER BY `NumberofGames` DESC