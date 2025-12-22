SELECT
  g.description AS Genre,
  ROUND(AVG(NumberOfPlayers)) AS AvgPlayers,
  COUNT(*) AS NumberOfGames
FROM `SteamGamesData.GamesDataFromSteamAPI`,
UNNEST(Genres) AS g
GROUP BY Genre
ORDER BY AvgPlayers DESC