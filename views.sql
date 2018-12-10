USE kursova2;
CREATE VIEW top5 AS 
    SELECT v.name AS name , count(*) AS count 
        FROM Videos v 
        JOIN UsersHasVideo uHV 
        USING(idVideo) 
        GROUP BY uHV.idVideo 
        ORDER BY count DESC
        LIMIT 5;

CREATE VIEW top50 AS 
    SELECT v.name AS name , count(*) AS count 
        FROM Videos v 
        JOIN UsersHasVideo uHV 
        USING(idVideo) 
        GROUP BY uHV.idVideo 
        ORDER BY count DESC
        LIMIT 50;

CREATE VIEW rand5 AS 
    SELECT v.name AS name
        FROM Videos v
        ORDER BY rand() 
        LIMIT 5;