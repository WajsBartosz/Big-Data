SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description = 'Co-op'
    )
    THEN 'Has Co-op'
    ELSE 'Does not have Co-op'
  END AS FamilySharing,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY FamilySharing