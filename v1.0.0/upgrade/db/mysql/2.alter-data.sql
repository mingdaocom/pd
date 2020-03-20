USE MDProject;

-- 部门成员（默认为主部门）
INSERT INTO Project_DepartmentAccount(ProjectId,DepartmentId,AccountId,IsMainDepartment,IsManager,CreateTime,CreateUser,UpdateTime,LastModifyUser,Deleted)
SELECT ProjectId,DepartmentId,AccountId,1,0,uc.CreateTime,uc.LastModifyUser,uc.UpdateTime,uc.LastModifyUser,0 FROM UsersCard uc
WHERE DepartmentId IS NOT NULL AND NOT EXISTS(SELECT 1 FROM Project_DepartmentAccount da WHERE  da.Deleted=0 AND uc.DepartmentId=da.DepartmentId AND uc.AccountId=da.AccountId AND uc.ProjectId=da.ProjectId);

-- 职位成员
INSERT INTO Project_JobAccount(ProjectId,JobId,AccountId,CreateTime,CreateUser,UpdateTime,LastModifyUser)
SELECT ProjectId,JobId,AccountId,IFNULL(uc.CreateTime,NOW()),uc.LastModifyUser,IFNULL(uc.UpdateTime,NOW()),uc.LastModifyUser FROM UsersCard uc
WHERE JobId IS NOT NULL AND NOT EXISTS(SELECT 1 FROM Project_JobAccount da WHERE  uc.JobId=da.JobId AND uc.AccountId=da.AccountId AND uc.ProjectId=da.ProjectId);

-- 导入or邀请 用户
UPDATE ImportUserInfo SET DepartmentIds=DepartmentId,JobIds=JobId
WHERE (DepartmentId IS NOT NULL OR JobId IS NOT NULL);

-- 部门负责人
UPDATE Project_DepartmentAccount da 
INNER JOIN Project_Department pd 
ON da.ProjectId=pd.ProjectID
AND da.DepartmentId=pd.DepartmentID
AND da.AccountId=pd.ChargeAccountId
SET IsManager=1
WHERE pd.ChargeAccountId IS NOT NULL
AND da.IsManager=0;