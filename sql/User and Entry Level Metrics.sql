-- User Level Metrics

-- 1. Total Users

SELECT COUNT(*) AS total_users
FROM dim_user;

-- 2. Users by Country

SELECT 
    country,
    COUNT(*) AS user_count
FROM dim_user
GROUP BY country
ORDER BY user_count DESC;

-- 3. Users by Subscription Type

SELECT 
    subscription_type,
    COUNT(*) AS user_count
FROM dim_user
GROUP BY subscription_type
ORDER BY user_count DESC;

-- 4. Average Age of Users

SELECT 
    ROUND(AVG(age),1) AS average_age
FROM dim_user;

-- 5. Active Users

SELECT 
    COUNT(DISTINCT u.user_id) AS active_users
FROM dim_user u
JOIN fact_listening_events e
    ON u.user_id = e.user_id;

-- 6. Users with more than 1 event

SELECT 
    u.user_id,
    COUNT(e.event_id) AS total_events
FROM dim_user u
JOIN fact_listening_events e
    ON u.user_id = e.user_id
GROUP BY u.user_id
HAVING COUNT(*) > 1;

-- EVENT LEVEL METRICS

-- 1. Total Listening Sessions

SELECT COUNT(*) AS total_sessions
FROM fact_listening_events;

-- 2. Total Listened Hours

SELECT ROUND(SUM(listened_seconds) / 3600, 2) AS total_listened_hours
FROM fact_listening_events;

-- 3. Average Session Length

SELECT ROUND(AVG(session_length_sec) / 60, 2) AS avg_session_length_min
FROM fact_listening_events;

-- 4. Completion Rate

SELECT 
    ROUND(100.0 * SUM(completed) / COUNT(*), 2) AS completion_rate_percent
FROM fact_listening_events;

-- 5. Events by Device

SELECT 
    device,
    COUNT(*) AS event_count
FROM fact_listening_events
GROUP BY device
ORDER BY event_count DESC;

-- Combined Metrics

-- 1. Average Listening Time per User

SELECT ROUND(SUM(e.listened_seconds) / COUNT(DISTINCT u.user_id) / 60, 2) AS avg_listening_minutes_per_user
FROM dim_user u
LEFT JOIN fact_listening_events e
    ON u.user_id = e.user_id;

-- 2. Completion Rate per User

SELECT top 10
    u.user_id,
    COUNT(e.event_id) AS total_sessions,
    ROUND(
        ISNULL(100.0 * SUM(e.completed) / NULLIF(COUNT(e.event_id),0), 0), 2) AS completion_rate_percent
FROM dim_user u
LEFT JOIN fact_listening_events e
    ON u.user_id = e.user_id
GROUP BY u.user_id
ORDER BY completion_rate_percent desc;
