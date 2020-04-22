USE MDProject;

-- 添加 通讯录规则表
-- ----------------------------
-- Table structure for Project_UserRule
-- ----------------------------
CREATE TABLE `Project_UserRule` (
  `AutoId` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` char(36) NOT NULL,
  `RuleId` char(36) NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `CreateUser` char(36) NOT NULL,
  `UpdateTime` datetime(6) NOT NULL,
  `LastModifyUser` char(36) NOT NULL,
  PRIMARY KEY (`AutoId`),
  KEY `IX_ProjectId` (`ProjectId`) USING BTREE,
  KEY `IX_RuleId` (`RuleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 添加 通讯录规则项表
-- ----------------------------
-- Table structure for Project_UserRuleItem
-- ----------------------------
CREATE TABLE `Project_UserRuleItem` (
  `AutoId` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectId` char(36) NOT NULL,
  `RuleId` char(36) NOT NULL,
  `RuleItemType` int(11) NOT NULL DEFAULT '0',
  `TargetId` varchar(50) NOT NULL,
  `TargetType` int(11) NOT NULL DEFAULT '0',
  `CreateTime` datetime(6) NOT NULL,
  `CreateUser` char(36) NOT NULL,
  PRIMARY KEY (`AutoId`),
  KEY `IX_ProjectId` (`ProjectId`) USING BTREE,
  KEY `IX_Rule_Project` (`ProjectId`,`RuleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;