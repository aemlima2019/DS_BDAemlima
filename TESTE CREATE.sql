PRINT '================================================================='
PRINT ' ALESSANDRO - DBANCO DE DADOS - IMPACTA'
PRINT ' QUERY - CREATE TABLE'
PRINT ' create_table.SQL '
PRINT '================================================================='
PRINT ' DATE/TIME	= ' + convert(VARCHAR,getdate(),121)
PRINT ' SERVER		= ' + @@SERVERNAME
PRINT ' DATABASE	= ' + DB_NAME()
PRINT ' USER		= ' + convert(VARCHAR,SUSER_NAME())
PRINT '================================================================='
GO

SET ANSI_NULLS ON --CODIFICAÇÃO ANSI
GO

SET QUOTED_IDENTIFIER ON --SQL Server segue as regras ISO relativas às aspas que delimitam identificadores e cadeias de caracteres literais
GO

IF EXISTS (

		SELECT *

		FROM sys.objects

		WHERE object_id = OBJECT_ID(N'[dbo].[TABLE]') --verifica se tabela existe, se sim, dropa tabela

			AND [TYPE] IN (
							N'U'
							,N'PC'
							)
		)

DROP TABLE [dbo].[TABLE]

GO

CREATE TABLE AULA1 (



)

PRINT '================================================================='
PRINT ' ALESSANDRO - DBANCO DE DADOS - IMPACTA'
PRINT ' QUERY - CREATE TABLE'
PRINT ' create_table.SQL '
PRINT '================================================================='
PRINT ' DATE/TIME	= ' + convert(VARCHAR,getdate(),121)
PRINT ' SERVER		= ' + @@SERVERNAME
PRINT ' DATABASE	= ' + DB_NAME()
PRINT ' USER		= ' + convert(VARCHAR,SUSER_NAME())
PRINT '================================================================='
GO