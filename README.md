# MySQLDB
About CHECK in tables database
==============================================================================================
TABLE `Groups` 
`typeGroup` CHECK(`type` IN ('y', 'g', 'd', 'a', 'o')) # year, genre, director, actor, other

TABLE `UsersHasVideo`
`typeStatus` CHECK(`status` IN ('c', 'h', 's')) #completed, happens, scheduled

TABLE `Log` 
`actionType` CHAR(1) NOT NULL CHECK (`actionType` IN ('i', 'u', 'd')) , # insert, update, delete