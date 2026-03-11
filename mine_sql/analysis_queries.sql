CREATE DATABASE IF NOT EXISTS cosmetics_db;
USE cosmetics_db;

CREATE TABLE IF NOT EXISTS events (
    event_time VARCHAR(50),
    event_type VARCHAR(20),
    product_id INT,
    category_id BIGINT,
    price DECIMAL(10, 2),
    user_id INT,
    user_session VARCHAR(50)
);

USE cosmetics_db;
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'qwertyu.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




SELECT event_type, COUNT(*)
FROM events
GROUP BY event_type;




SELECT DISTINCT event_type, price, product_id
FROM events
WHERE event_type = 'purchase'
ORDER BY price DESC
LIMIT 5;

SELECT event_type, COUNT(*) as total_events
FROM events
GROUP BY event_type;


SELECT
	(SELECT COUNT(DISTINCT user_id) FROM events WHERE event_type = 'purchase') /
    (SELECT COUNT(DISTINCT user_id) FROM events) * 100 AS conversion_rate;

SELECT SUM(price) AS lost_revenue
FROM events
WHERE event_type = 'remove_from_cart';