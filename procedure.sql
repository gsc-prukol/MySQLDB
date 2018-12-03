delimiter //

CREATE PROCEDURE deleteOldLog(in sTime DATETIME )
BEGIN
DELETE FROM log
WHERE time <= sTime;
END //