SELECT
  CASE WHEN IsFree THEN 'Free' ELSE 'Paid' END AS Type,
  COUNT(*) AS Count
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY Type