USE kursova2;
DELIMITER //

CREATE TRIGGER video_AFTER_INSERT AFTER INSERT ON Videos 
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Videos', 'i', NEW.idVideo, NEW.name);
END //

CREATE TRIGGER video_AFTER_UPDATE AFTER UPDATE ON Videos 
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Videos', 'u', NEW.idVideo, NEW.name);
END //

CREATE TRIGGER video_AFTER_DELETE AFTER DELETE ON Videos
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Videos', 'd', OLD.idVideo, OLD.name);
END //

CREATE TRIGGER user_AFTER_INSERT AFTER INSERT ON Users
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Users', 'i', NEW.idUser, NEW.login);
END //

CREATE TRIGGER user_AFTER_UPDATE AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Users', 'u', NEW.idUser, NEW.login);
END //

CREATE TRIGGER user_AFTER_DELETE AFTER DELETE ON Users 
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Users', 'd', OLD.idUser, OLD.login);
END //

CREATE TRIGGER group_AFTER_INSERT AFTER INSERT ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'i', NEW.idGroup, NEW.name);
END //

CREATE TRIGGER group_AFTER_UPDATE AFTER UPDATE ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'u', NEW.idGroup, NEW.name);
END //

CREATE TRIGGER group_AFTER_DELETE AFTER DELETE ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'd', OLD.idGroup, OLD.name);
END //



CREATE TRIGGER group_BEFORE_UPDATE BEFORE UPDATE ON Groups
FOR EACH ROW
BEGIN
SET NEW.idGroup = OLD.idGroup;
END //

CREATE TRIGGER user_BEFORE_UPDATE BEFORE UPDATE ON Users
FOR EACH ROW
BEGIN
SET NEW.idUser = OLD.idUser;
END //

CREATE TRIGGER video_BEFORE_UPDATE BEFORE UPDATE ON Videos 
FOR EACH ROW
BEGIN
SET NEW.idVideo = OLD.idVideo;
END //

DELIMITER ;