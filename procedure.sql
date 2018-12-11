USE ka66_03;
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

CREATE PROCEDURE updateUserLogin(IN id INT UNSIGNED, 
                            IN plogin varchar(45))
BEGIN 
    UPDATE Users
    SET login = plogin
    WHERE idUser = id;
END //

CREATE PROCEDURE updateUserPasswordHash(IN id INT UNSIGNED, 
                            IN ppasswordHash VARCHAR(100))
BEGIN 
    UPDATE Users
    SET passwordHash = passwordHash
    WHERE idUser = id;
END //

CREATE PROCEDURE updateUserName(IN id INT UNSIGNED, 
                            IN pname VARCHAR(45) )
BEGIN 
    UPDATE Users
    SET name = pname
    WHERE idUser = id;
END //

CREATE PROCEDURE deleteUser(IN id INT UNSIGNED)
BEGIN
    DELETE FROM Users
    WHERE idUser = id;
END //


CREATE PROCEDURE insertVideo(IN pname varchar(200),
                             IN pduration TIME,
                             IN prating TINYINT(4),
                             IN purl VARCHAR(200))
BEGIN
    INSERT INTO Videos (name, duration, rating, url)
    VALUE(pname, pduration, prating, purl);
END //

CREATE PROCEDURE updateVideo(IN id INT UNSIGNED,
                             IN pname varchar(200),
                             IN pduration TIME,
                             IN prating TINYINT(4),
                             IN purl VARCHAR(200))
BEGIN
    UPDATE Videos 
    SET name = pname, duration = pduration, rating = prating, url = purl
    WHERE idVideo = id;
END //

CREATE PROCEDURE updateVideoName(IN id INT UNSIGNED,
                                 IN pname varchar(200))
BEGIN
    UPDATE Videos 
    SET name = pname
    WHERE idVideo = id;
END //

CREATE PROCEDURE updateVideoDuration(IN id INT UNSIGNED,
                                     IN pduration TIME)
BEGIN
    UPDATE Videos 
    SET duration = pduration
    WHERE idVideo = id;
END //

CREATE PROCEDURE updateVideoRating(IN id INT UNSIGNED,
                             IN prating TINYINT(4))
BEGIN
    UPDATE Videos 
    SET rating = prating
    WHERE idVideo = id;
END //

CREATE PROCEDURE updateVideoUrl(IN id INT UNSIGNED,
                             IN purl VARCHAR(200))
BEGIN
    UPDATE Videos 
    SET url = purl
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

CREATE PROCEDURE updateGroupName(IN id INT UNSIGNED,
                             IN pname CHAR(80))
BEGIN
    UPDATE Groups
    SET name = pname
    WHERE idVideo = id;
END //

CREATE PROCEDURE updateGroupType(IN id INT UNSIGNED,
                             IN ptype CHAR(1))
BEGIN
    UPDATE Groups
    SET type = ptype
    WHERE idVideo = id;
END //

CREATE PROCEDURE deleteGroup(IN id INT UNSIGNED)
BEGIN
    DELETE FROM Groups
    WHERE idGroup = id;
END //

#################################################################
CREATE PROCEDURE addVideoUser(IN sidUser INT UNSIGNED, 
                              IN sidVideo INT UNSIGNED,
                              IN sstatus CHAR(1))
BEGIN
    INSERT INTO UsersHasVideo(idUser, idVideo, status)
    VALUES(sidUsers, sidVideo, sstatus);
END //
delimiter ;
