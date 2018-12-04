USE kursova;
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
VALUES('Users', 'i', NEW.idUsers, NEW.login);
END //

CREATE TRIGGER user_AFTER_UPDATE AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Users', 'u', NEW.idUsers, NEW.login);
END //

CREATE TRIGGER user_AFTER_DELETE AFTER DELETE ON Users 
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Users', 'd', OLD.idUsers, OLD.login);
END //

CREATE TRIGGER group_AFTER_INSERT AFTER INSERT ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'i', NEW.idGroups, NEW.name);
END //

CREATE TRIGGER group_AFTER_UPDATE AFTER UPDATE ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'u', NEW.idGroups, NEW.name);
END //

CREATE TRIGGER group_AFTER_DELETE AFTER DELETE ON Groups
FOR EACH ROW
BEGIN
INSERT INTO Log(tableName, actionType,idRowsTable,  logMessage)
VALUES('Groups', 'd', OLD.idGroups, OLD.name);
END //



CREATE TRIGGER group_BEFORE_UPDATE BEFORE UPDATE ON Groups
FOR EACH ROW
BEGIN
SET NEW.idGroups = OLD.idGroups;
END //

CREATE TRIGGER user_BEFORE_UPDATE BEFORE UPDATE ON Users
FOR EACH ROW
BEGIN
SET NEW.idUsers = OLD.idUsers;
END //

CREATE TRIGGER video_BEFORE_UPDATE BEFORE UPDATE ON Videos 
FOR EACH ROW
BEGIN
SET NEW.idVideo = OLD.idVideo;
END //

DELIMITER ;