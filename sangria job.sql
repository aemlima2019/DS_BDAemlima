PRINT '================================================================='
PRINT ' GRUPO BIG - CENTRAL TEAM DATA ANALITYCS'
PRINT ' QUERY - Sangrias'
PRINT ' truncate_cmException.SQL '
PRINT '================================================================='
PRINT ' DATE/TIME	= ' + convert(VARCHAR,getdate(),121)
PRINT ' SERVER		= ' + @@SERVERNAME
PRINT ' DATABASE	= ' + DB_NAME()
PRINT ' USER		= ' + convert(VARCHAR,SUSER_NAME())
PRINT '================================================================='
GO

SET ANSI_NULLS ON --CODIFICA«?O ANSI
GO

SET QUOTED_IDENTIFIER ON --SQL Server segue as regras ISO relativas ‡s aspas que delimitam identificadores e cadeias de caracteres literais
GO

IF EXISTS (

		SELECT *

		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'[dbo].[p_subscription_error]') --verifica se tabela existe, se sim, dropa tabela

			AND [TYPE] IN (
							N'P'
							,N'PC'
							)
		)

DROP PROCEDURE [dbo].[p_subscription_error]

GO

CREATE PROCEDURE [dbo].[p_subscription_error] (@users VARCHAR(MAX))

AS

BEGIN

	IF EXISTS (

			SELECT *

			FROM sys.objects

			WHERE object_id = OBJECT_ID(N'[dbo].[#TMP_Subscription]')

				AND [TYPE] IN (
								N'P'
								,N'PC'
					)
			)
		
	DROP TABLE [dbo].[#TMP_Subscription]

	-- Cria a tabela tempor√°ria
	CREATE TABLE #TMPSubscription ([idUser] [varchar](10) NOT NULL) ON [PRIMARY]

	INSERT INTO #TMPSubscription
	
	SELECT DISTINCT 
	
		iduser
	
	FROM 
	
		fsSynchronizationLog FS(NOLOCK)
	
	WHERE
	
	--	dtLog BETWEEN GETDATE() AND DATEPART(HH, -3) AND

		FS.dtLog BETWEEN '2014-10-07 00:00:00' AND '2014-10-08 00:00:00' AND --	vlMsgDetail IS NOT NULL AND 

		FS.vlMsgDetail = 'SQLE_UPLOAD_FAILED_AT_SERVER'

	DECLARE @idUser INT

	DECLARE users_cursor CURSOR
	
	FOR
	
	SELECT idUser
	
	FROM #TMPSubscription

		OPEN users_cursor

		FETCH NEXT
	
		FROM users_cursor
	
		INTO @idUser

		WHILE @@FETCH_STATUS = 0
	
			BEGIN

				EXEC ml_reset_sync_state @remote_id = NULL

					,@user = @idUser

				FETCH NEXT
			
				FROM users_cursor

				INTO @idUser
			END

	CLOSE users_cursor

	DEALLOCATE users_cursor
END

PRINT '================================================================='
PRINT ' SPRING WIRELESS'
PRINT ' QUERY - Sangrias'
PRINT ' truncate_cmException.SQL '
PRINT '================================================================='
PRINT ' DATE/TIME	= ' + convert(VARCHAR,getdate(),121)
PRINT ' SERVER		= ' + @@SERVERNAME
PRINT ' DATABASE	= ' + DB_NAME()
PRINT ' USER		= ' + convert(VARCHAR,SUSER_NAME())
PRINT '================================================================='
GO