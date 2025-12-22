SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description = 'Full controller support'
    )
    THEN 'with full controller support'
    ELSE 'without full controller support'
  END AS ControllerSupport,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY ControllerSupport