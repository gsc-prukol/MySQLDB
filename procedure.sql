USE kursova;
delimiter //

CREATE PROCEDURE deleteOldLog(IN sTime DATETIME )
BEGIN
    DELETE FROM log
    WHERE time <= sTime;
END //


CREATE PROCEDURE insertUsers(IN plogin varchar(45),
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

CREATE PROCEDURE deleteUser( In id INT UNSIGNED)
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

CREATE PROCEDURE insertGroup(IN pname CHAR(80),
                                 IN ptype CHAR(1))
BEGIN
    INSERT INTO Groups (name, type)
    VALUE(pname, ptype);
END //



delimiter ;