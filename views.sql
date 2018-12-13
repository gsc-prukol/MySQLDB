USE ka66_03;
DROP VIEW IF EXISTS top5;
DROP VIEW IF EXISTS top50;
DROP VIEW IF EXISTS rand5;

CREATE VIEW top5 AS 
    SELECT v.name AS name , count(*) AS count, v.url as url 
        FROM videos v 
        JOIN users_has_video uHV 
        USING(id_video) 
        GROUP BY uHV.id_video 
        ORDER BY count DESC
        LIMIT 5;

CREATE VIEW top50 AS 
    SELECT v.name AS name , count(*) AS count, v.url as url 
        FROM videos v 
        JOIN users_has_video uHV 
        USING(id_video) 
        GROUP BY uHV.id_video 
        ORDER BY count DESC
        LIMIT 50;

CREATE VIEW rand5 AS 
    SELECT v.name AS name, v.url as url 
        FROM videos v
        ORDER BY rand() 
        LIMIT 5;