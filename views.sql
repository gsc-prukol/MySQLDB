USE ka66_03;
DROP VIEW IF EXISTS top5;
DROP VIEW IF EXISTS top50;
DROP VIEW IF EXISTS rand5;
DROP VIEW IF EXISTS rand50;
DROP VIEW IF EXISTS group50;
DROP VIEW IF EXISTS video50;
CREATE VIEW top5 AS 
    SELECT v.name AS name , count(*) AS count, v.url as url 
        FROM videos v 
        JOIN user_has_video uHV 
        USING(id_video) 
        GROUP BY uHV.id_video 
        ORDER BY count DESC
        LIMIT 5;

CREATE VIEW top50 AS 
    SELECT v.name AS name , count(*) AS count, v.url as url, v.id_video as id_video
        FROM videos v 
        JOIN user_has_video uHV 
        USING(id_video) 
        GROUP BY uHV.id_video 
        ORDER BY count DESC
        LIMIT 50;

CREATE VIEW rand5 AS 
    SELECT v.name AS name, v.url as url 
        FROM videos v
        ORDER BY rand() 
        LIMIT 5;

CREATE VIEW rand50 AS 
    SELECT v.name AS name, v.url as url, v.id_video as id_video 
        FROM videos v
        ORDER BY rand() 
        LIMIT 50;

CREATE VIEW group50 AS 
    SELECT g.name AS name, g.id_group as id_group 
        FROM groups g
        ORDER BY rand() 
        LIMIT 50;

CREATE VIEW video50 AS 
    SELECT v.name AS name, v.url as url, v.id_video as id_video 
        FROM videos v
        ORDER BY id_video DESC
        LIMIT 50;