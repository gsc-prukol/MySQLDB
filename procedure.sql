USE ka66_03;
delimiter //

CREATE PROCEDURE delete_old_log(IN stime DATETIME )
BEGIN
    DELETE FROM log
    WHERE time <= stime;
END //


CREATE PROCEDURE insert_user(IN plogin varchar(45),
                            IN ppassword_hash VARCHAR(100),
                            IN pname VARCHAR(45))
BEGIN
    INSERT INTO users (login, password_hash, name)
    VALUE(plogin, ppassword_hash, pname);
END //

CREATE PROCEDURE update_user(IN id INT UNSIGNED, 
                            IN plogin varchar(45),
                            IN ppassword_hash VARCHAR(100),
                            IN pname VARCHAR(45),
                            IN pstatus CHAR(1) )
BEGIN 
    UPDATE users
    SET login = plogin, ppassword_hash = password_hash, name = pname, status = pstatus
    WHERE id_user = id;
END //

CREATE PROCEDURE update_user_login(IN id INT UNSIGNED, 
                                   IN plogin varchar(45))
BEGIN 
    UPDATE users
    SET login = plogin
    WHERE id_user = id;
END //

CREATE PROCEDURE update_user_name(IN id INT UNSIGNED, 
                            IN pname VARCHAR(45) )
BEGIN 
    UPDATE users
    SET name = pname
    WHERE id_user = id;
END //

CREATE PROCEDURE update_user_status(IN id INT UNSIGNED, 
                                  IN pstatus CHAR(1) )
BEGIN 
    UPDATE users
    SET status = pstatus
    WHERE id_user = id;
END //

CREATE PROCEDURE delete_user(IN id INT UNSIGNED)
BEGIN
    DELETE FROM users
    WHERE id_user = id;
END //


CREATE PROCEDURE insert_video(IN pname varchar(200),
                             IN purl VARCHAR(200))
BEGIN
    INSERT INTO videos (name, url)
    VALUE(pname, purl);
END //

CREATE PROCEDURE update_video(IN id INT UNSIGNED,
                             IN pname varchar(200),
                             IN purl VARCHAR(200))
BEGIN
    UPDATE videos 
    SET name = pname, url = purl
    WHERE id_video = id;
END //

CREATE PROCEDURE update_video_name(IN id INT UNSIGNED,
                                 IN pname varchar(200))
BEGIN
    UPDATE videos 
    SET name = pname
    WHERE id_video = id;
END //

CREATE PROCEDURE update_video_url(IN id INT UNSIGNED,
                             IN purl VARCHAR(200))
BEGIN
    UPDATE videos 
    SET url = purl
    WHERE id_video = id;
END //

CREATE PROCEDURE delete_video(IN id INT UNSIGNED)
BEGIN
    DELETE FROM videos
    WHERE id_video = id;
END //


CREATE PROCEDURE insert_group(IN pname CHAR(80))
BEGIN
    INSERT INTO groups (name)
    VALUE(pname);
END //

CREATE PROCEDURE update_group(IN id INT UNSIGNED,
                             IN pname CHAR(80))
BEGIN
    UPDATE groups
    SET name = pname
    WHERE id_group = id;
END //

CREATE PROCEDURE update_group_name(IN id INT UNSIGNED,
                             IN pname CHAR(80))
BEGIN
    UPDATE groups
    SET name = pname
    WHERE id_group = id;
END //

CREATE PROCEDURE delete_group(IN id INT UNSIGNED)
BEGIN
    DELETE FROM groups
    WHERE id_group = id;
END //

--#################################################################
CREATE PROCEDURE add_user_has_video(IN sid_user INT UNSIGNED, 
                              IN sid_video INT UNSIGNED,
                              IN sstatus CHAR(1))
BEGIN
    INSERT INTO user_has_video(id_user, id_video, status)
    VALUES(sid_users, sid_video, sstatus);
END //
CREATE PROCEDURE update_user_has_video_status(IN sid_user INT UNSIGNED, 
                              IN sid_video INT UNSIGNED,
                              IN sstatus CHAR(1))
BEGIN
    UPDATE user_has_video
    SET status = sstatus
    WHERE id_user = sid_user AND id_video = sid_video;
END //
delimiter ;
