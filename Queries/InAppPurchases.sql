SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description = 'In-App Purchases'
    )
    THEN 'Has in-app purchases'
    ELSE 'Does not have in-app purchases'
  END AS FamilySharing,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY FamilySharing