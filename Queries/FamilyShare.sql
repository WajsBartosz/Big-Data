SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description = 'Family Sharing'
    )
    THEN 'Has Family Sharing'
    ELSE 'No Family Sharing'
  END AS FamilySharing,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY FamilySharing