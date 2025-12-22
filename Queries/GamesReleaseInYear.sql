SELECT RIGHT(ReleaseData, 4) AS ReleaseDate, COUNT(*) AS NumberOfReleasedGamesInThisYear FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY ReleaseDate
HAVING ReleaseDate NOT LIKE ''
ORDER BY ReleaseDate