USE MDProject;

-- 支持多部门负责人
alter table Project_Department modify column ChargeAccountId varchar(1024);
