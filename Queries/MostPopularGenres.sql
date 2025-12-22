SELECT Genre.description AS `GenreName`, COUNT(*) AS GameCount FROM `SteamGamesData.GamesDataFromSteamAPI`, UNNEST(Genres) AS Genre
GROUP BY Genre
ORDER BY GameCount DESC