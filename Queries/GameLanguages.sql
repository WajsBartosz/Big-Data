WITH Cleaned AS (
  SELECT
    Name,
    TRIM(lang) AS Language
  FROM `SteamGamesData.GamesDataFromSteamAPI`,
  UNNEST(
    SPLIT(
      REGEXP_REPLACE(
        REGEXP_REPLACE(
          SupportedLanguages,
          r'<[^>]+>|languages with full audio support',
          ''
        ),
        r'\*',
        ''
      ),
      ','
    )
  ) AS lang
)

SELECT
  Language,
  COUNT(DISTINCT Name) AS GamesCount
FROM Cleaned
WHERE Language != ''
GROUP BY Language
ORDER BY GamesCount DESC