SELECT
  CASE WHEN IsFree THEN 'Free' ELSE 'Paid' END AS Type,
  ROUND(AVG(NumberOfPlayers)) AS AvgPlayers
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY Type