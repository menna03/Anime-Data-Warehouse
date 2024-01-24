SELECT [AnimeName], [EpisodeNumber] AS 'Max number of Episode'
FROM [dbo].[Anime_Properties]
WHERE [EpisodeNumber] = (SELECT MAX([EpisodeNumber]) FROM [dbo].[Anime_Properties]);

SELECT COUNT(DISTINCT animeType) AS DistinctAnimeTypeCount
FROM dbo.Anime_Properties;

SELECT animeType, COUNT(*) AS AnimeTypeCount
FROM dbo.Anime_Properties
GROUP BY animeType
ORDER BY AnimeTypeCount DESC;

select[UserID], ([ratingUser])
from[dbo].[Rating]
where [ratingUser]=10


select count([ratingUser]) As 'Number of Rate 10'
from[dbo].[Rating]
where [ratingUser]=10

SELECT [ratingUser], COUNT(*) AS RatingUserCount
FROM [dbo].[Rating]
GROUP BY [ratingUser]
ORDER BY [ratingUser] ;