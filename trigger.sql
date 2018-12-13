USE ka66_03;
DELIMITER //

CREATE TRIGGER video_AFTER_INSERT AFTER INSERT ON videos 
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('videos', 'i', NEW.id_video, NEW.name);
END //

CREATE TRIGGER video_AFTER_UPDATE AFTER UPDATE ON videos 
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('videos', 'u', NEW.id_video, NEW.name);
END //

CREATE TRIGGER video_AFTER_DELETE AFTER DELETE ON videos
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('videos', 'd', OLD.id_video, OLD.name);
END //

CREATE TRIGGER user_AFTER_INSERT AFTER INSERT ON users
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('users', 'i', NEW.id_user, NEW.login);
END //

CREATE TRIGGER user_AFTER_UPDATE AFTER UPDATE ON users
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('users', 'u', NEW.id_user, NEW.login);
END //

CREATE TRIGGER user_AFTER_DELETE AFTER DELETE ON users 
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('users', 'd', OLD.id_user, OLD.login);
END //

CREATE TRIGGER group_AFTER_INSERT AFTER INSERT ON groups
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('groups', 'i', NEW.id_group, NEW.name);
END //

CREATE TRIGGER group_AFTER_UPDATE AFTER UPDATE ON groups
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('groups', 'u', NEW.id_group, NEW.name);
END //

CREATE TRIGGER group_AFTER_DELETE AFTER DELETE ON groups
FOR EACH ROW
BEGIN
INSERT INTO log(table_name, action_type,id_row_table,  log_message)
VALUES('groups', 'd', OLD.id_group, OLD.name);
END //



CREATE TRIGGER group_BEFORE_UPDATE BEFORE UPDATE ON groups
FOR EACH ROW
BEGIN
SET NEW.id_group = OLD.id_group;
END //

CREATE TRIGGER user_BEFORE_UPDATE BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
SET NEW.id_user = OLD.id_user;
END //

CREATE TRIGGER video_BEFORE_UPDATE BEFORE UPDATE ON videos 
FOR EACH ROW
BEGIN
SET NEW.id_video = OLD.id_video;
END //

DELIMITER ;