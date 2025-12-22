SELECT 'Windows' AS Platform, COUNT(*) AS PlayableGames
FROM `SteamGamesData.GamesDataFromSteamAPI`
WHERE PlayableOnWindows = TRUE
UNION ALL
SELECT 'MacOS', COUNT(*)
FROM `SteamGamesData.GamesDataFromSteamAPI`
WHERE PlayableOnMac = TRUE
UNION ALL
SELECT 'Linux', COUNT(*)
FROM `SteamGamesData.GamesDataFromSteamAPI`
WHERE PlayableOnLinux = TRUE