delimiter //

CREATE PROCEDURE deleteOldLog(IN sTime DATETIME )
BEGIN
    DELETE FROM log
    WHERE time <= sTime;
END //

CREATE PROCEDURE insertIntoUsers(IN plogin varchar(45),
                                 IN ppassworldHash VARCHAR(100),
                                 IN pname VARCHAR(45))
BEGIN
    INSERT INTO kursova.Users (login, passworldHash, name)
    VALUE(plogin, ppassworldHash, pname);
END //

CREATE PROCEDURE insertIntoVideos(IN pname varchar(200),
                                 IN pduration TIME DEFAULT "00:00:00",
                                 IN prating TINYINT(4)  DEFAULT 5,
                                 IN purl VARCHAR(200)  DEFAULT "")
BEGIN
    INSERT INTO kursova.Videos (name, duration, rating, url)
    VALUE(pname, pduration, prating, purl);
END //

CREATE PROCEDURE insertIntoGroups(IN pname CHAR(80),
                                 IN ptype CHAR(1))
BEGIN
    INSERT INTO kursova.Groups (name, type)
    VALUE(pname, ptype);
END //

CREATE PROCEDURE updateUsers(IN id INT UNSIGNED, 
                             IN plogin varchar(45),
                             IN ppassworldHash VARCHAR(100),
                             IN pname VARCHAR(45) )
BEGIN 
    UPDATE kursova.Users
    SET login = plogin, ppassworldHash = passworldHash, name = pname
    WHERE idUser = id;
END //