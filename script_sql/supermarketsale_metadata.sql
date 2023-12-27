USE MASTER
GO

IF DB_ID('supermarketsale_metadata') IS NOT NULL
	DROP DATABASE supermarketsale_metadata;
GO

CREATE DATABASE supermarketsale_metadata
GO

USE supermarketsale_metadata
GO


CREATE TABLE Data_Flow(
	ID int IDENTITY(1,1) primary key,
	tenbang varchar(50) NULL,
	LSET datetime NULL,
	CET datetime NULL
)
GO
CREATE TABLE InputPackage(
	ID int IDENTITY(1,1) primary key,
	PackageName [nvarchar](260),
	FolderName [sysname],
	ProjectName [sysname],
	CreatedDate Datetime,
	Active Int
)
INSERT INTO InputPackage (PackageName,FolderName,ProjectName,CreatedDate,Active) 
VALUES
('StageToNDS.dtsx','Test','Test',GETDATE(),1),
('ExcelToSource.dtsx','Test','Test',GETDATE(),1)
INSERT INTO Data_Flow(tenbang,LSET) VAlues
	('product_stage','1-1-1970'),
	('city_stage','1-1-1970'),
	('productline_stage','1-1-1970'),
	('sale_stage','1-1-1970'),
	('fact_sales','1-1-1970'),
('dds_product','1-1-1970'),
('dds_city','1-1-1970'),
('dds_customer_type','1-1-1970'),
('dds_payment_type','1-1-1970'),
('dds_gender','1-1-1970'),
('dds_productline','1-1-1970'),
('dds_date','1-1-1970'),
('system_audit','1-1-1970'),
('validations','1-1-1970'),
('executions','1-1-1970'),
('machines','1-1-1970'),
('servers','1-1-1970'),
('users','1-1-1970'),
('system_infos','1-1-1970'),
('execution_tasks','1-1-1970'),
('execution_task_component','1-1-1970')



CREATE TABLE  [servers](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[server_name] [nvarchar](128) NULL,
	[created_time] [datetimeoffset](7) NULL,
)
CREATE TABLE  [machines](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[machine_name] [nvarchar](128) NULL,
	[created_time] [datetimeoffset](7) NULL,
)
CREATE TABLE  [users](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[user_sid] [varbinary](85) NULL,
	[user_name] [nvarchar](128) NULL,

)

CREATE TABLE  [folders](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[folder_id] [bigint]  NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
	[created_by_userid] [bigint],
	[active] [int] not NULL,
	FOREIGN KEY(created_by_userid) REFERENCES users(id_sk),
)
GO
CREATE TABLE  [projects](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[project_id] [bigint] NOT NULL,
	[folder_id] [bigint] NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[project_format_version] [int] NULL,
	[deployed_by_userid] [bigint],
	[last_deployed_time] [datetimeoffset](7) NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
	[object_version_lsn] [bigint] NOT NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
	[active] [int] not NULL,
	FOREIGN KEY(folder_id) REFERENCES folders(id_sk),
	FOREIGN KEY(deployed_by_userid) REFERENCES users(id_sk),
)
GO

CREATE TABLE  [packages](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[package_id] [bigint]  NOT NULL,
	[name] [nvarchar](260) NOT NULL,
	[package_guid] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[package_format_version] [int] NOT NULL,
	[version_major] [int] NOT NULL,
	[version_minor] [int] NOT NULL,
	[version_build] [int] NOT NULL,
	[version_comments] [nvarchar](1024) NULL,
	[version_guid] [uniqueidentifier] NOT NULL,
	[project_id] [bigint] NOT NULL,
	[entry_point] [bit] NOT NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
	[package_data] [varbinary](max) NULL,
	[deployed_by_userid] [bigint],
	[created_time] [datetimeoffset](7) NOT NULL,
	[active] [int] not NULL,
	FOREIGN KEY(project_id) REFERENCES projects(id_sk),
	FOREIGN KEY(deployed_by_userid) REFERENCES users(id_sk),
)
GO
CREATE TABLE  [executables](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[executable_id] [bigint]  NOT NULL,
	[package_id] [bigint] NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[executable_name] [nvarchar](4000) NULL,
	[executable_guid] [nvarchar](38) NULL,
	[package_path] [nvarchar](max) NULL,
	[active] [int] not NULL,
	FOREIGN KEY(package_id) REFERENCES packages(id_sk),
) 
GO

CREATE TABLE  [executions](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[reference_id] [bigint] NULL,
	[reference_type] [char](1) NULL,
	[environment_folder_name] [nvarchar](128) NULL,
	[environment_name] [nvarchar](128) NULL,
	[executed_by_userid]  [bigint],
	[use32bitruntime] [bit] NOT NULL,
	[job_id] [uniqueidentifier] NULL,
	[created_time] [datetimeoffset](7) NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[called_by_userid] [bigint],
	[process_id] [int] NULL,
	[stopped_by_userid] [bigint],
	[server_name_id] [bigint],
	[machine_name_id] [bigint],
	[worker_agent_id] [uniqueidentifier] NULL,
	[executed_count] [int] NULL,
	[total_physical_memory_kb] [bigint] NOT NULL,
	[available_physical_memory_kb] [bigint] NULL,
	[total_page_file_kb] [bigint] NULL,
	[available_page_file_kb] [bigint] NOT NULL,
	[cpu_count] [int] NOT NULL,
	[package_id] [bigint] NOT NULL,
	FOREIGN KEY(package_id) REFERENCES packages(id_sk),
	FOREIGN KEY(called_by_userid) REFERENCES users(id_sk),
	FOREIGN KEY(stopped_by_userid) REFERENCES users(id_sk),
	FOREIGN KEY(server_name_id) REFERENCES [servers](id_sk),
	FOREIGN KEY(machine_name_id)  REFERENCES machines(id_sk)

)
GO
CREATE TABLE  [executable_statistics](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[statistics_id] [bigint]  NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[task_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[execution_hierarchy] [hierarchyid] NULL,
	[execution_duration] [int] NULL,
	[execution_result] [smallint] NULL,
	[active] [int] not NULL,
	FOREIGN KEY(execution_id) REFERENCES executions(id_sk),
	FOREIGN KEY(task_id) REFERENCES executables(id_sk),
 )
GO


CREATE TABLE  [execution_data_statistics](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[executable_statistics_id] [bigint]  NULL,
	[component_name] [nvarchar](4000) NULL,
	[rows_received] [bigint] NULL,
	[rows_sent] [bigint] NULL,
	[table_name] [nvarchar](4000) NULL,
	FOREIGN KEY(executable_statistics_id) REFERENCES executable_statistics(id_sk),
	[active] [int] not NULL,

)
GO

CREATE TABLE  [validations](
	[id_sk] [bigint] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[validation_id] [bigint] NOT NULL,
	[environment_scope] [char](1) NOT NULL,
	[validate_type] [char](1) NOT NULL,
	[package_id] [bigint] NOT NULL,
	[use32bitruntime] [bit] NULL,
	[reference_id] [bigint] NULL,
	[job_id] [uniqueidentifier] NULL,
	[created_time] [datetimeoffset](7) NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[called_by_userid] [bigint],
	[process_id] [int] NULL,
	[stopped_by_userid] [bigint],
	[server_name_id] [bigint],
	[machine_name_id] [bigint],
	[executed_count] [int] NULL,
	FOREIGN KEY(package_id) REFERENCES packages(id_sk),
	FOREIGN KEY(called_by_userid) REFERENCES users(id_sk),
	FOREIGN KEY(stopped_by_userid) REFERENCES users(id_sk),
	FOREIGN KEY(server_name_id) REFERENCES [servers](id_sk),
	FOREIGN KEY(machine_name_id)  REFERENCES machines(id_sk)
	
)
GO




--
--ALTER TABLE  [executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables] FOREIGN KEY([executable_id])
--REFERENCES [executables] ([id_sk])
--ON DELETE CASCADE
--GO
--ALTER TABLE  [executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables]
--GO
--ALTER TABLE  [executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions] FOREIGN KEY([execution_id])
--REFERENCES [executions] ([id_sk])
--ON DELETE CASCADE
--GO
--ALTER TABLE  [executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions]
--GO
--
--
--ALTER TABLE  [execution_component_phases]  WITH CHECK ADD  CONSTRAINT [FK_ExecCompPhases_ExecutionId_Executions] FOREIGN KEY([execution_id])
--REFERENCES [executions] ([id_sk])
--ON DELETE CASCADE
--GO
--ALTER TABLE  [execution_component_phases] CHECK CONSTRAINT [FK_ExecCompPhases_ExecutionId_Executions]
--GO
--ALTER TABLE  [execution_data_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions] FOREIGN KEY([execution_id])
--REFERENCES [executions] ([id_sk])
--ON DELETE CASCADE
--GO
--ALTER TABLE  [execution_data_statistics] CHECK CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions]
--GO


USE MASTER
--DROP DATABASE supermarketsale_metadata