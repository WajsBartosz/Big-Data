SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description = 'Single-player'
    )
    THEN 'Has Single-player'
    ELSE 'Does not have Single-player'
  END AS FamilySharing,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY FamilySharing