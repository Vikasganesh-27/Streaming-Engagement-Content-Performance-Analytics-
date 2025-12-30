
-- Metrics

-- 1. Total Streams per Track

SELECT top 10
    t.track_id,
    t.track_name,
    SUM(f.streams) AS total_streams
FROM fact_Streams f
JOIN dim_Track t 
    ON f.track_id = t.track_id
GROUP BY 
    t.track_id, 
    t.track_name
ORDER BY 
    total_streams DESC;

-- 2. Total Streams per Artist
 
SELECT top 10 a.artist_id, a.artist_name, SUM(f.streams) AS total_streams
FROM fact_Streams f
JOIN dim_Track t 
    ON f.track_id = t.track_id
JOIN dim_Artist a 
    ON t.artist_id = a.artist_id
GROUP BY a.artist_id, a.artist_name
ORDER BY total_streams DESC;

-- 3. Streams by Release Year

select top 10 YEAR(release_date) as release_year, SUM(f.streams) as total_streams
from fact_streams f
join dim_track t
	on f.track_id = t.track_id
group by YEAR(release_date)
order by YEAR(release_date) desc

-- 4. Engagement Score

SELECT top 10
    t.track_id,
    t.track_name,
    (f.streams * 0.6 
     + (f.spotify_playlists + f.apple_playlists + f.deezer_playlists) * 0.25
     + (f.spotify_charts + f.apple_charts + f.deezer_charts + f.shazam_charts) * 0.15
    ) AS engagement_score
FROM fact_streams f
JOIN dim_track t 
    ON f.track_id = t.track_id
ORDER BY engagement_score DESC;

-- 5. Total Playlist Exposure per Track

SELECT TOP 10
    t.track_id,
    t.track_name,
    (f.spotify_playlists 
     + f.apple_playlists 
     + f.deezer_playlists) AS total_playlist_exposure
FROM Fact_Streams f
JOIN Dim_Track t 
    ON f.track_id = t.track_id
ORDER BY 
    total_playlist_exposure DESC;

-- 6. Total Chart Exposure per Track

SELECT top 10
    t.track_id,
    t.track_name,
    (f.spotify_charts
     + f.apple_charts
     + f.deezer_charts
     + f.shazam_charts) AS total_chart_exposure
FROM Fact_Streams f
JOIN Dim_Track t 
    ON f.track_id = t.track_id
ORDER BY
    total_chart_exposure DESC;

-- 7. Top Tracks per Platform

select top 10 t.track_id, t.track_name, 
sum(f.spotify_playlists) as spotify_playlist,
sum(f.apple_playlists) as apple_playlist,
sum(f.deezer_playlists) as deezer_playlist
from dim_track t
join fact_streams f
	on t.track_id = f.track_id
group by t.track_id, t.track_name
order by spotify_playlist desc;

-- 8. Stream Efficiency Score

SELECT
    t.track_id,
    t.track_name,
    f.streams / NULLIF(
        (f.spotify_playlists + f.apple_playlists + f.deezer_playlists 
         + f.spotify_charts + f.apple_charts + f.deezer_charts + f.shazam_charts), 0
    ) AS efficiency_score
FROM fact_Streams f
JOIN dim_Track t 
    ON f.track_id = t.track_id
ORDER BY 
    efficiency_score DESC;

-- 9. Platform ROI

SELECT
    t.track_id,
    t.track_name,
    (f.streams / NULLIF(f.spotify_playlists, 0)) AS spotify_roi,
    (f.streams / NULLIF(f.apple_playlists, 0)) AS apple_roi,
    (f.streams / NULLIF(f.deezer_playlists, 0)) AS deezer_roi
FROM Fact_Streams f
JOIN Dim_Track t 
    ON f.track_id = t.track_id
ORDER BY spotify_roi DESC;

-- 10. Audio Feature Average per Artist

SELECT
    a.artist_name,
    AVG(t.danceability) AS avg_danceability,
    AVG(t.energy) AS avg_energy,
    AVG(t.valence) AS avg_valence,
    AVG(t.bpm) AS avg_bpm
FROM Dim_Track t
JOIN Dim_Artist a ON t.artist_id = a.artist_id
GROUP BY a.artist_name
ORDER BY a.artist_name;


