USE [s3cr3tx]
GO
/****** Object:  Table [dbo].[Auth]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth](
	[vID] [bigint] IDENTITY(1,1) NOT NULL,
	[vEmail] [nvarchar](256) NOT NULL,
	[vIsValid] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[UpdatedBy] [nvarchar](256) NOT NULL,
	[AuthCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Auth] PRIMARY KEY CLUSTERED 
(
	[vID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[files]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[files](
	[fileID] [bigint] IDENTITY(1,1) NOT NULL,
	[fileOwnerEmail] [nvarchar](256) NOT NULL,
	[fileOriginalName] [nvarchar](256) NOT NULL,
	[fileDirPath] [nvarchar](512) NOT NULL,
	[fileDbPath] [nvarchar](512) NOT NULL,
	[fileVirtualPath] [nvarchar](512) NULL,
	[fileDescription] [nvarchar](512) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_files] PRIMARY KEY CLUSTERED 
(
	[fileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forgot]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forgot](
	[reset_id] [bigint] IDENTITY(1,1) NOT NULL,
	[reset_email] [nvarchar](256) NOT NULL,
	[reset_code] [nvarchar](50) NOT NULL,
	[reset_start] [datetime] NOT NULL,
	[reset_expires] [datetime] NOT NULL,
	[req_IP] [nvarchar](256) NOT NULL,
	[member_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m](
	[mID] [bigint] IDENTITY(1,1) NOT NULL,
	[mGuid1] [nvarchar](50) NOT NULL,
	[mGuid2] [nvarchar](50) NOT NULL,
	[mEmail] [nvarchar](256) NOT NULL,
	[mAPIKey] [nvarchar](256) NOT NULL,
	[mAuthorization] [nvarchar](512) NOT NULL,
	[mPrivateKey] [nvarchar](max) NOT NULL,
	[mPublicKey] [nvarchar](max) NOT NULL,
	[mCreateTime] [datetime] NOT NULL,
	[mPmHash] [nvarchar](256) NULL,
	[mUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_m] PRIMARY KEY CLUSTERED 
(
	[mID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_archive]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_archive](
	[member_archive_id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NOT NULL,
	[member_code] [nvarchar](512) NOT NULL,
	[current_code] [bit] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[update_date] [datetime] NOT NULL,
 CONSTRAINT [PK_member_archive] PRIMARY KEY CLUSTERED 
(
	[member_archive_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_sessions]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_sessions](
	[session_id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_id] [bigint] NOT NULL,
	[member_email] [nvarchar](256) NOT NULL,
	[member_token] [nvarchar](50) NOT NULL,
	[member_name] [nvarchar](50) NOT NULL,
	[session_start] [datetime] NOT NULL,
	[session_active] [bit] NOT NULL,
	[session_last_active] [datetime] NOT NULL,
	[session_end] [datetime] NOT NULL,
	[member_ip] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_NewTable] PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[members]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[member_id] [bigint] IDENTITY(1,1) NOT NULL,
	[member_email] [nvarchar](256) NOT NULL,
	[member_code] [nvarchar](max) NOT NULL,
	[member_first_name] [nvarchar](25) NOT NULL,
	[member_last_name] [nvarchar](25) NOT NULL,
	[member_reg_number] [nvarchar](40) NOT NULL,
	[member_create_date] [datetime] NOT NULL,
	[member_update_date] [datetime] NOT NULL,
	[member_enabled] [bit] NOT NULL,
	[member_confirmed] [bit] NOT NULL,
	[member_country] [nvarchar](30) NULL,
	[member_state] [nvarchar](25) NULL,
	[member_gender] [nvarchar](20) NULL,
	[member_mobile_phone] [nvarchar](20) NULL,
	[member_mobile_carrier] [nvarchar](25) NULL,
	[member_city] [nvarchar](30) NULL,
	[member_zip] [nvarchar](10) NULL,
	[member_address] [nvarchar](50) NULL,
	[member_address2] [nvarchar](50) NULL,
	[member_order_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_members] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msg]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg](
	[msg_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[msg_from] [nvarchar](256) NULL,
	[msg_to] [nvarchar](256) NULL,
	[msg_text] [nvarchar](max) NULL,
	[msg_attachments] [bit] NULL,
	[msg_sent] [datetime] NULL,
	[msg_delivered] [datetime] NOT NULL,
	[msg_received] [datetime] NOT NULL,
	[msg_deleted] [bit] NULL,
	[msg_DeletedTime] [datetime] NULL,
 CONSTRAINT [PK_msg] PRIMARY KEY CLUSTERED 
(
	[msg_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msg_attachments]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg_attachments](
	[fileID] [bigint] IDENTITY(1,1) NOT NULL,
	[msg_id] [bigint] NOT NULL,
	[fileOwnerEmail] [nvarchar](256) NOT NULL,
	[fileOriginalName] [nvarchar](256) NOT NULL,
	[fileDirPath] [nvarchar](512) NOT NULL,
	[fileDbPath] [nvarchar](512) NOT NULL,
	[fileVirtualPath] [nvarchar](512) NULL,
	[fileDescription] [nvarchar](512) NULL,
	[CreateDate] [datetime] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_msg_attachments] PRIMARY KEY CLUSTERED 
(
	[fileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[LogID] [bigint] IDENTITY(1,1) NOT NULL,
	[LogSource] [nvarchar](50) NOT NULL,
	[LogMessage] [nvarchar](max) NOT NULL,
	[LogCreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auth] ADD  CONSTRAINT [DF_Auth_vIsValid]  DEFAULT ((0)) FOR [vIsValid]
GO
ALTER TABLE [dbo].[Auth] ADD  CONSTRAINT [DF_Auth_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Auth] ADD  CONSTRAINT [DF_Auth_UpdateDate]  DEFAULT (getutcdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[files] ADD  CONSTRAINT [DF_files_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[m] ADD  CONSTRAINT [DF_m_mCreateTime]  DEFAULT (getutcdate()) FOR [mCreateTime]
GO
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [DEFAULT_members_member_enabled]  DEFAULT ((0)) FOR [member_enabled]
GO
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [DEFAULT_members_member_confirmed]  DEFAULT ((0)) FOR [member_confirmed]
GO
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [DEFAULT_members_member_order_number]  DEFAULT ((0)) FOR [member_order_number]
GO
ALTER TABLE [dbo].[msg] ADD  CONSTRAINT [DF_msg_msg_attachments]  DEFAULT ((0)) FOR [msg_attachments]
GO
ALTER TABLE [dbo].[msg] ADD  CONSTRAINT [DF_msg_msg_deleted]  DEFAULT ((0)) FOR [msg_deleted]
GO
ALTER TABLE [dbo].[msg_attachments] ADD  CONSTRAINT [DF_msg_attachments_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[msg_attachments] ADD  CONSTRAINT [DF_msg_attachments_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[tblLog] ADD  CONSTRAINT [DF_tblLog_LogCreateDate]  DEFAULT (getutcdate()) FOR [LogCreateDate]
GO
/****** Object:  StoredProcedure [dbo].[checkAuth]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[checkAuth]
(@APIKey nvarchar(256),
@Authorization nvarchar(512),
@email nvarchar(256))
with recompile
as set nocount on
declare @result int 
set @result = (Select count(*) from dbo.Auth where vIsValid = 1 and vEmail = @email)
if @result > 0
begin
Select count(*) as "cnt" from dbo.m where mEmail = @email and mAPIKey = @APIKey and mAuthorization = @Authorization ;
End
else
Begin
Select 0 as "cnt"
End
GO
/****** Object:  StoredProcedure [dbo].[checkCredentials]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[checkCredentials]
(@email nvarchar(256),
@pword nvarchar(512)
)
with recompile
as set nocount on
declare @result int 
set @result = (Select count(*) from dbo.Auth members where  vIsValid = 1 and vEmail = @email)
if @result = 1
begin
Select count(*) as "cnt" from dbo.members where member_email = @email and member_code = @pword  and member_enabled = 1 and member_confirmed = 1;
End
else
Begin
Select 0 as "cnt"
End

GO
/****** Object:  StoredProcedure [dbo].[EorD]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[EorD]
@Auth nvarchar(512),
@APIToken nvarchar(256),
 @email nvarchar(max),
 @input nvarchar(max),
 @EorD bit,
 @blnDefault bit,
 @strOutput nvarchar(max) output

-- TODO: Set parameter values here.
with recompile as
set nocount on
Declare @isAuth int
declare @strText nvarchar(max)
Set @isAuth = (Select count(*) from dbo.m where mEmail = @email and mAuthorization = @Auth and mAPIKey = @APIToken)
if @isAuth > 0 
Begin
set @strOutput = N'+True'
End
else
Begin
set @strOutput = N''
End
GO
/****** Object:  StoredProcedure [dbo].[getBundle]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBundle] 
	@email nvarchar(256)
	--@mAPIKey nvarchar(256),
	--@mAuthorization nvarchar(512)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [mID], [mGuid1], [mGuid2], [mEmail], [mAPIKey], [mAuthorization], [mPrivateKey], [mPublicKey]
	from dbo.m
	where mEmail = @email --and mAPIKey = @mAPIKey and mAuthorization = @mAuthorization
END
GO
/****** Object:  StoredProcedure [dbo].[GetCode]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetCode]
(@email nvarchar(256)
)
with recompile
as set nocount on
declare @result int 
set @result = (Select count(*) from dbo.members where member_confirmed = 1 and member_email = @email)
if @result = 1
begin
Select member_code from dbo.members where member_email = @email and member_confirmed = 1;
End
else
Begin
Select N'';
End

GO
/****** Object:  StoredProcedure [dbo].[insertAuth]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[insertAuth](
@Email nvarchar(256),
@IsValid bit,
@CreatedBY nvarchar(256),
@AuthCode nvarchar(50)
)
with recompile
as 
set nocount on
declare @timestamp datetime
set @timestamp = (Select GETUTCDATE())

INSERT INTO [dbo].[Auth]
           ([vEmail]
           ,[vIsValid]
           ,[CreateDate]
           ,[UpdateDate]
           ,[CreatedBy]
           ,[UpdatedBy]
           ,[AuthCode])
     VALUES
           (@Email
           ,@IsValid
           ,@timestamp
           ,@timestamp
           ,@CreatedBY
           ,@CreatedBY
           ,@AuthCode)
GO
/****** Object:  StoredProcedure [dbo].[insertFile]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertFile](
@fileOwner nvarchar(256),
           @fileOrigName nvarchar(256)
           ,@fileDirPath nvarchar(512)
           ,@fileDbPath nvarchar(512)
           ,@fileVirtualPath nvarchar(512) = null
           ,@fileDescription nvarchar(512) = null
           )
		   With Recompile as
		   set nocount on
		   declare @CreateDate datetime
		   set @CreateDate = (Select GETUTCDATE())
		   
INSERT INTO [dbo].[files]
           ([fileOwnerEmail]
           ,[fileOriginalName]
           ,[fileDirPath]
           ,[fileDbPath]
           ,[fileVirtualPath]
           ,[fileDescription]
           ,[CreateDate])
     VALUES
           (@fileOwner,
           @fileOrigName
           ,@fileDirPath
           ,@fileDbPath
           ,@fileVirtualPath
           ,@fileDescription
		   ,@CreateDate)
GO
/****** Object:  StoredProcedure [dbo].[insertLog]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertLog]
@Source nvarchar(50),
@logMessage nvarchar(max)
with recompile
as 
set nocount on

INSERT INTO [dbo].[tblLog]
           ([LogSource]
           ,[LogMessage]
           ,[LogCreateDate])
     VALUES
           (@Source
           ,@logMessage
           ,GETUTCDATE())
GO
/****** Object:  StoredProcedure [dbo].[InsertM]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[InsertM](
@Guid1 nvarchar(50),
@Guid2 nvarchar(50),
@Email nvarchar(256),
@APIKey nvarchar(256),
@Authorization nvarchar(512),
@PmHash nvarchar(256),
@PrivateKey nvarchar(max),
@PublicKey nvarchar(max)
)
with recompile
as
set nocount on
declare @valid bit, @TimeStamp datetime
set @TimeStamp = (Select GETUTCDATE())
set @valid = (Select vIsValid from dbo.Auth where vEmail = @Email)
if @Valid = 1
Begin

INSERT INTO [dbo].[m]
           ([mGuid1]
           ,[mGuid2]
           ,[mEmail]
           ,[mAPIKey]
           ,[mAuthorization]
           ,[mPrivateKey]
           ,[mPublicKey]
           ,[mCreateTime]
		   ,[mPmHash]
		   ,[mUpdateTime])
     VALUES
           (@Guid1
           ,@Guid2
           ,@Email
           ,@APIKey
           ,@Authorization
           ,@PrivateKey
           ,@PublicKey
           ,@TimeStamp
		   ,@PmHash
		   ,@TimeStamp)
		   return 1
End
else
begin
return 0
end
GO
/****** Object:  StoredProcedure [dbo].[isValidEmail]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[isValidEmail] 
	-- Add the parameters for the stored procedure here
	(@email nvarchar(256)) 
as	
Begin
SET NOCOUNT ON;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT Count(*) from dbo.Auth where vEmail = @email and vIsValid = 1;
End
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBundle_M]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetBundle_M] 
	@mEmail nvarchar(256),
	@mAPIKey nvarchar(256),
	@mAuthorization nvarchar(512)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [mID], [mGuid1], [mGuid2], [mEmail], [mAPIKey], [mAuthorization], [mPrivateKey], [mPublicKey]
	from dbo.m
	where mEmail = @mEmail and mAPIKey = @mAPIKey and mAuthorization = @mAuthorization
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetBundle_M_Host]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetBundle_M_Host] 
	@mEmail nvarchar(256),
    @mHost nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [mID], [mGuid1], [mGuid2], [mEmail], [mAPIKey], [mAuthorization], [mPrivateKey], [mPublicKey]
	from dbo.m
	where mEmail = @mEmail and  @mHost = N's3cr3tx.com'-- mAuthorization = @mAuthorization
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_forgot_ins]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_forgot_ins]
  (@member_email nvarchar(256),@member_token nvarchar(50),@session_start datetime,@session_end datetime, @member_ip nvarchar(256),@member_id bigint)
AS
  BEGIN
       INSERT INTO [dbo].[forgot]
        ([reset_email],[reset_code],[reset_start],[reset_expires],[req_IP],[member_id])
      VALUES
        (@member_email,@member_token,@session_start,@session_end,@member_ip, @member_id);
    END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_forgot_sel]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_tbl_forgot_sel]
  (@member_email nvarchar(256),@member_token nvarchar(50))
AS
DECLARE @default DATETIME
BEGIN
 
SELECT member_id, reset_expires
      FROM [s3cr3tx].[dbo].[forgot] where reset_email = @member_email and reset_code = @member_token;
  END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_ins]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_ins]
  (@member_email nvarchar(256),@member_code nvarchar(max),@member_first_name nvarchar(25),@member_last_name nvarchar(25),@member_reg_number nvarchar(40),@member_create_date datetime,@member_update_date datetime,@ID bigint=NULL,@member_country nvarchar(30)=NULL,@member_state nvarchar(25)=NULL,@member_gender nvarchar(20)=NULL,@member_mobile_phone nvarchar(20)=NULL,@member_mobile_carrier nvarchar(25)=NULL,@member_city nvarchar(30)=NULL,@member_zip nvarchar(10)=NULL,@member_address nvarchar(50)=NULL,@member_address2 nvarchar(50)=NULL,@member_order nvarchar(50)=NULL)
AS
Declare @result bigint
set @result = 0
BEGIN
  IF (Select COUNT(*) from members where member_email = @member_email and member_enabled = 1 and member_confirmed = 1) = 0 
    BEGIN
      INSERT INTO [dbo].[members]
        ([member_email],[member_code],[member_first_name],[member_last_name],[member_reg_number],[member_create_date],[member_update_date],[member_country],[member_state],[member_gender],[member_mobile_phone],[member_mobile_carrier],[member_city],[member_zip],[member_address],[member_address2],[member_order_number])
      VALUES
       (@member_email,@member_code,@member_first_name,@member_last_name,@member_reg_number,@member_create_date,@member_update_date,@member_country,@member_state,@member_gender,@member_mobile_phone,@member_mobile_carrier,@member_city,@member_zip,@member_address,@member_address2,@member_order);
      set @result = (SELECT member_id FROM [dbo].[members] WHERE [member_id] = SCOPE_IDENTITY())
      Select @result;
    END
  ELSE
    BEGIN
      set @result = (Select 0)
      select @result;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_login_sel]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_login_sel]
  (@email nvarchar(256))
AS
BEGIN
  IF @email IS NULL OR @email = N''
    SELECT N'';
  ELSE
    SELECT member_reg_number FROM [dbo].[members] WHERE [member_email] = @email and member_enabled = 1 and member_confirmed = 1;--in(Select top 1(vEmail) from dbo.Auth where vEmail);
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sel]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sel]
  (@member_id bigint=NULL)
AS
BEGIN
  IF @member_id IS NULL OR @member_id = 0
    SELECT * FROM [dbo].[members] ORDER BY [member_id] ASC;
  ELSE
    SELECT * FROM [dbo].[members] WHERE [member_id] = @member_id;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sel_email]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sel_email]
  (@email nvarchar(256))
AS
BEGIN
    SELECT * FROM [dbo].[members] WHERE [member_email] = @email and member_confirmed = 1;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sel_reg]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sel_reg]
  (@email nvarchar(256))
AS
BEGIN
    SELECT member_reg_number FROM [dbo].[members] WHERE [member_email] = @email and member_confirmed = 1;
End

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sel_reg_confirm]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sel_reg_confirm]
  (@email nvarchar(256),@reg_number nvarchar(256))
AS
Declare @emptyResult bigint
set @emptyResult = 0
if (SELECT count(*) FROM [dbo].[members] WHERE [member_email] = @email and member_confirmed = 0 and member_reg_number = @reg_number) =1
BEGIN
    SELECT member_id FROM [dbo].[members] WHERE [member_email] = @email and member_confirmed = 0 and member_reg_number = @reg_number;
END
ELSE
BEGIN
select @emptyResult;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sessions_ins]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sessions_ins]
  (@member_id bigint,@member_email nvarchar(256),@member_token nvarchar(50),@member_name nvarchar(50),@session_start datetime,@session_active bit,@sesion_last_active datetime,@session_end datetime, @member_ip nvarchar(256))
AS
BEGIN
  IF @member_id IS NULL OR @member_id = 0
    BEGIN
      SELECT 0;
    END
  ELSE
  BEGIN
       INSERT INTO [dbo].[member_sessions]
        ([member_id],[member_email],[member_token],[member_name],[session_start],[session_active],[session_last_active],[session_end],[member_ip])
      VALUES
        (@member_id,@member_email,@member_token,@member_name,@session_start,@session_active,@sesion_last_active,@session_end,@member_ip);
      SELECT * FROM [dbo].[member_sessions] WHERE [session_id] = SCOPE_IDENTITY();
    END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sessions_sel]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sessions_sel]
  (@ID bigint=NULL)
AS
BEGIN
  IF @ID IS NULL OR @ID = 0
    SELECT * FROM [dbo].[member_sessions] ORDER BY [session_id] ASC;
  ELSE
    SELECT * FROM [dbo].[member_sessions] WHERE [session_id] = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sessions_selCode]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sessions_selCode]
  (@ID nvarchar(50))
AS
BEGIN
  IF @ID IS NOT NULL OR @ID != N''
    SELECT * FROM [dbo].[member_sessions] WHERE [member_token] = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_sessions_ups]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_sessions_ups]
  (@member_id bigint,@member_email nvarchar(256),@member_token nvarchar(50),@member_name nvarchar(50),@session_start datetime,@session_active bit,@session_last_active datetime,@session_end datetime,@member_ip nvarchar(256),@ID bigint=NULL)
AS
BEGIN
  IF @ID IS NULL OR @ID = 0
    BEGIN
      INSERT INTO [dbo].[member_sessions]
        ([member_id],[member_email],[member_token],[member_name],[session_start],[session_active],[session_last_active],[session_end],[member_ip])
      VALUES
        (@member_id,@member_email,@member_token,@member_name,@session_start,@session_active,@session_last_active,@session_end,@member_ip);
      SELECT * FROM [dbo].[member_sessions] WHERE [session_id] = SCOPE_IDENTITY();
    END
  ELSE
  BEGIN
      UPDATE [dbo].[member_sessions]
        SET [member_id]=@member_id,[member_email]=@member_email,[member_token]=@member_token,[member_name]=@member_name,[session_start]=@session_start,[session_active]=@session_active,[session_last_active]=@session_last_active,[session_end]=@session_end, [member_ip] = @member_ip
        WHERE ([session_id] = @ID);
      SELECT * FROM [dbo].[member_sessions] WHERE [session_id] = @ID;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_set_confirmed]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_set_confirmed]
  (@email nvarchar(256), @reg_number nvarchar(40))
AS
BEGIN
    Update dbo.members set member_confirmed = 1, member_enabled = 1 WHERE [member_email] = @email and [member_reg_number] = @reg_number;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_set_newp]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Select Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_set_newp]
  (@email nvarchar(256), @member_code nvarchar(max),@member_id bigint)
AS
BEGIN
    Update dbo.members set member_code = @member_code WHERE [member_email] = @email and [member_id] = @member_id;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_update]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

CREATE PROCEDURE [dbo].[usp_tbl_member_update]
  (@member_id bigint,@member_email nvarchar(256),@member_first_name nvarchar(25),@member_last_name nvarchar(25),@member_reg_number nvarchar(30),@member_create_date datetime,@member_update_date datetime,@member_country nvarchar(30)=NULL,@member_state nvarchar(25)=NULL,@member_gender nvarchar(20)=NULL,@member_mobile_phone nvarchar(20)=NULL,@member_mobile_carrier nvarchar(25)=NULL,@member_city nvarchar(30)=NULL,@member_zip nvarchar(10)=NULL,@member_address nvarchar(50)=NULL,@member_address2 nvarchar(50)=NULL,@member_order nvarchar(50)=NULL)
AS
Set NOCOUNT On;
BEGIN
  IF (Select COUNT(*) from members where [member_id] = @member_id and member_email = @member_email and member_enabled = 1 and member_confirmed = 1) = 1 
    BEGIN
      UPDATE [dbo].[members]
        SET [member_email]=@member_email,[member_first_name]=@member_first_name,[member_last_name]=@member_last_name,[member_reg_number]=@member_reg_number,[member_create_date]=@member_create_date,[member_update_date]=@member_update_date,[member_country]=@member_country,[member_state]=@member_state,[member_gender]=@member_gender,[member_mobile_phone]=@member_mobile_phone,[member_mobile_carrier]=@member_mobile_carrier,[member_city]=@member_city,[member_zip]=@member_zip,[member_address]=@member_address,[member_address2]=@member_address2,[member_order_number]=@member_order
        WHERE ([member_id] = @member_id); -- AND ([RowVersion] = @RowVersion);
      SELECT * FROM [dbo].[members] WHERE [member_id] = @member_id;
    END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_tbl_member_ups]    Script Date: 5/9/2023 4:10:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ===================================================================
-- Author      : Patrick Kelly | Gratitech
-- Create date : 03/04/2023
-- Revised date: 
-- Description : Upsert Member Data
-- ===================================================================

Create PROCEDURE [dbo].[usp_tbl_member_ups]
  (@member_email nvarchar(256),@member_code nvarchar(512),@member_first_name nvarchar(25),@member_last_name nvarchar(25),@member_reg_number nvarchar(30),@member_create_date datetime,@member_update_date datetime,@ID bigint=NULL,@member_country nvarchar(30)=NULL,@member_state nvarchar(25)=NULL,@member_gender nvarchar(20)=NULL,@member_mobile_phone nvarchar(20)=NULL,@member_mobile_carrier nvarchar(25)=NULL,@member_city nvarchar(30)=NULL,@member_zip nvarchar(10)=NULL,@member_address nvarchar(50)=NULL,@member_address2 nvarchar(50)=NULL,@member_order nvarchar(50)=NULL)
AS
BEGIN
  IF (@ID IS NULL OR @ID = 0) and (Select COUNT(*) from members where member_email = @member_email and member_enabled = 1 and member_confirmed = 1) = 0 
   
    BEGIN
      INSERT INTO [dbo].[members]
        ([member_email],[member_code],[member_first_name],[member_last_name],[member_reg_number],[member_create_date],[member_update_date],[member_country],[member_state],[member_gender],[member_mobile_phone],[member_mobile_carrier],[member_city],[member_zip],[member_address],[member_address2],[member_order_number])
      VALUES
       (@member_email,@member_code,@member_first_name,@member_last_name,@member_reg_number,@member_create_date,@member_update_date,@member_country,@member_state,@member_gender,@member_mobile_phone,@member_mobile_carrier,@member_city,@member_zip,@member_address,@member_address2,@member_order);
      SELECT * FROM [dbo].[members] WHERE [member_id] = SCOPE_IDENTITY();
    END
  ELSE
    BEGIN
      UPDATE [dbo].[members]
        SET [member_email]=@member_email,[member_code]=@member_code,[member_first_name]=@member_first_name,[member_last_name]=@member_last_name,[member_reg_number]=@member_reg_number,[member_create_date]=@member_create_date,[member_update_date]=@member_update_date,[member_country]=@member_country,[member_state]=@member_state,[member_gender]=@member_gender,[member_mobile_phone]=@member_mobile_phone,[member_mobile_carrier]=@member_mobile_carrier,[member_city]=@member_city,[member_zip]=@member_zip,[member_address]=@member_address,[member_address2]=@member_address2,[member_order_number]=@member_order
        WHERE ([member_id] = @ID); -- AND ([RowVersion] = @RowVersion);
      SELECT * FROM [dbo].[members] WHERE [member_id] = @ID;
    END
END

GO
