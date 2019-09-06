use fit_alunos
go

CREATE TABLE PacienteAC3M3 (
	ID INT NOT NULL IDENTITY(1,1)
	, Nome VARCHAR(50) NOT NULL
	, Telefone INT NULL
	, CONSTRAINT PK_Paciente PRIMARY KEY ( ID )
)
GO

CREATE TABLE SalaAC3M3 (
	Numero INT NOT NULL 
	, CONSTRAINT PK_Sala PRIMARY KEY ( Numero )
)
GO

	CREATE TABLE MedicoAC3M3 (
	ID INT NOT NULL IDENTITY(1,1)
	, CRM VARCHAR(10) NOT NULL
	, Nome VARCHAR(50) NOT NULL
	, Especialidade VARCHAR(30) NULL
	, CONSTRAINT PK_Medico PRIMARY KEY ( ID )
)
GO
	CREATE TABLE ConsultaAC3M3 (
	ID INT NOT NULL IDENTITY(1,1)
	, ID_Paciente INT NOT NULL
	, ID_Medico INT NOT NULL
	, Numero_Sala INT NOT NULL
	, DataHora DATETIME NOT NULL
	, Duracao TINYINT NOT NULL
	, CONSTRAINT PK_Consulta PRIMARY KEY ( ID )
	, CONSTRAINT FK_ConsultaMedico FOREIGN KEY ( Id_medico ) REFERENCES MedicoAC3M3( ID )
	, CONSTRAINT FK_ConsultaPaciente FOREIGN KEY ( Id_paciente ) REFERENCES PacienteAC3M3( ID )
	, CONSTRAINT FK_ConsultaSala FOREIGN KEY ( Numero_Sala ) REFERENCES SalaAC3M3( Numero )
)
GO

select * from SalaAC3M3
select * from ConsultaAC3M3
select * from PacienteAC3M3

alter table ConsultaAC3M3
add constraint pkConsDatHorNunSal unique (numero_sala, datahora)

alter table ConsultaAC3M3
add constraint pkDur check (Duracao in ('15','30','45','60'))

alter table SalaAC3M3
add [Tipo Sala] char(20) not null

alter table SalaAC3M3
add constraint pkTipSal default ('Sala de Cirurgia') for [Tipo Sala]

alter table ConsultaAC3M3
add constraint pkDurDF default (30) for Duracao


