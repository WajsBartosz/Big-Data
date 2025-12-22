SELECT
  CASE
    WHEN EXISTS (
      SELECT 1
      FROM UNNEST(Categories) c
      WHERE c.description IN ('PvP', 'Online PvP')
    )
    THEN 'Has PvP'
    ELSE 'Does not have PvP'
  END AS PvP_Type,
  COUNT(*) AS GameCount
FROM `SteamGamesData.GamesDataFromSteamAPI`
GROUP BY PvP_Type