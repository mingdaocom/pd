
USE MDProject;

-- 部门表 增加 SortIndex 和 Deleted 字段
ALTER TABLE `Project_Department`
ADD COLUMN `SortIndex`  int(6) NOT NULL DEFAULT 0 AFTER `ChargeAccountId`,
ADD COLUMN `Deleted`  bit(1) NOT NULL DEFAULT b'0' AFTER `SortIndex`;


-- 增加 ImportUserInfo 的 多部门Id、职位字段
ALTER TABLE `ImportUserInfo`
ADD COLUMN `DepartmentIds`  varchar(1000) NULL AFTER `JobId`,
ADD COLUMN `JobIds`  varchar(1000) NULL AFTER `DepartmentIds`;


-- 创建 部门成员表
CREATE TABLE `Project_DepartmentAccount` (
  `AutoId` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` char(36) NOT NULL,
  `DepartmentId` char(36) NOT NULL,
  `AccountId` char(36) NOT NULL,
  `IsMainDepartment` bit(1) NOT NULL DEFAULT b'0',
  `IsManager` bit(1) NOT NULL DEFAULT b'0',
  `CreateTime` datetime(6) NOT NULL,
  `CreateUser` char(36) DEFAULT NULL,
  `UpdateTime` datetime(6) NOT NULL,
  `LastModifyUser` char(36) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AutoId`),
  KEY `IX_DELETED` (`Deleted`) USING BTREE,
  KEY `IX_P_D_A` (`ProjectId`,`DepartmentId`,`AccountId`,`Deleted`) USING BTREE,
  KEY `IX_P` (`ProjectId`,`Deleted`) USING BTREE,
  KEY `IX_P_D` (`ProjectId`,`DepartmentId`,`Deleted`) USING BTREE,
  KEY `IX_PA` (`ProjectId`,`AccountId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- 创建 职位成员表

CREATE TABLE `Project_JobAccount` (
  `AutoId` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` char(36) NOT NULL,
  `JobId` char(36) NOT NULL,
  `AccountId` char(36) NOT NULL,
  `CreateUser` char(36) DEFAULT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `UpdateTime` datetime(6) NOT NULL,
  `LastModifyUser` char(36) DEFAULT NULL,
  PRIMARY KEY (`AutoId`),
  KEY `IX_PJA` (`ProjectId`,`JobId`,`AccountId`) USING BTREE,
  KEY `IX_PJ` (`ProjectId`,`JobId`) USING BTREE,
  KEY `IX_P` (`ProjectId`) USING BTREE,
  KEY `IX_PA` (`ProjectId`,`AccountId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;