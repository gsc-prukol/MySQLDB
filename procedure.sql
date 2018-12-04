USE kursova;
delimiter //

CREATE PROCEDURE deleteOldLog(IN sTime DATETIME )
BEGIN
    DELETE FROM log
    WHERE time <= sTime;
END //


CREATE PROCEDURE insertUser(IN plogin varchar(45),
                            IN ppasswordHash VARCHAR(100),
                            IN pname VARCHAR(45))
BEGIN
    INSERT INTO Users (login, passwordHash, name)
    VALUE(plogin, ppasswordHash, pname);
END //

CREATE PROCEDURE updateUser(IN id INT UNSIGNED, 
                            IN plogin varchar(45),
                            IN ppasswordHash VARCHAR(100),
                            IN pname VARCHAR(45) )
BEGIN 
    UPDATE Users
    SET login = plogin, ppasswordHash = passwordHash, name = pname
    WHERE idUser = id;
END //

CREATE PROCEDURE deleteUser(IN id INT UNSIGNED)
BEGIN
    DELETE FROM Users
    WHERE idUser = id;
END //
CREATE PROCEDURE insertVideo(IN pname varchar(200),
                             IN pduration TIME DEFAULT "00:00:00",
                             IN prating TINYINT(4)  DEFAULT 5,
                             IN purl VARCHAR(200)  DEFAULT "")
BEGIN
    INSERT INTO Videos (name, duration, rating, url)
    VALUE(pname, pduration, prating, purl);
END //

CREATE PROCEDURE updateVideo(IN id INT UNSIGNED,
                             IN pname varchar(200),
                             IN pduration TIME DEFAULT "00:00:00",
                             IN prating TINYINT(4)  DEFAULT 5,
                             IN purl VARCHAR(200)  DEFAULT "")
BEGIN
    UPDATE Videos 
    SET name = pname, duration = pduration, rating = prating, url = purl
    WHERE idVideo = id;
END //


CREATE PROCEDURE deleteVideo(IN id INT UNSIGNED)
BEGIN
    DELETE FROM Videos
    WHERE idVideo = id;
END //

CREATE PROCEDURE insertGroup(IN pname CHAR(80),
                             IN ptype CHAR(1))
BEGIN
    INSERT INTO Groups (name, type)
    VALUE(pname, ptype);
END //

CREATE PROCEDURE updateGroup(IN id INT UNSIGNED,
                             IN pname CHAR(80),
                             IN ptype CHAR(1))
BEGIN
    UPDATE Groups
    SET name = pname, type = ptype
    WHERE idVideo = id;
END //

CREATE PROCEDURE deleteGroups(IN id INT UNSIGNED)
BEGIN
    DELETE FROM Groups
    WHERE idGroup = id;
END //
delimiter ;