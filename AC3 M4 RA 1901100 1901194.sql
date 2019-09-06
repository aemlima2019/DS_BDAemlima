use fit_alunos
go

CREATE TABLE FornecedorAC3M4 (
	ID INT NOT NULL IDENTITY(1,1)
	, Nome VARCHAR(50) NOT NULL
	, CONSTRAINT PK_Fornecedor PRIMARY KEY ( ID )
)
GO
CREATE TABLE ProdutoAC3M4 (
	ID INT NOT NULL IDENTITY(1,1)
	, Nome VARCHAR(50) NOT NULL
	, ID_FornecedorPadrao INT NOT NULL
	, CONSTRAINT PK_ProdutoAC3M4 PRIMARY KEY ( ID )
	, CONSTRAINT FK_ProdutoFornecedorPadrao FOREIGN KEY ( Id_FornecedorPadrao ) REFERENCES FornecedorAC3M4( ID )
)
GO
CREATE TABLE CompraAC3M4 (
	NF VARCHAR(15) NOT NULL
	, DiasEntrega TINYINT NOT NULL
	, Valor FLOAT NOT NULL
	, [Data] DATE NOT NULL
	, CONSTRAINT PK_Compra PRIMARY KEY ( NF )
)
GO
CREATE TABLE ItemCompraAC3M4 (
	ID_Produto INT NOT NULL
	, ID_Fornecedor INT NOT NULL
	, NF_Compra VARCHAR(15) NOT NULL
	, QTDE INT NOT NULL
	, CONSTRAINT PK_ItemCompra PRIMARY KEY ( ID_Produto, ID_Fornecedor, NF_Compra )
	, CONSTRAINT FK_ItemCompraProduto FOREIGN KEY ( ID_produto ) REFERENCES ProdutoAC3M4 ( ID )
	, CONSTRAINT FK_ItemCompraFornecedor FOREIGN KEY ( ID_fornecedor) REFERENCES FornecedorAC3M4 ( ID )
	, CONSTRAINT FK_ItemCompraCompra FOREIGN KEY ( NF_Compra ) REFERENCES CompraAC3M4 ( NF )
)
GO

alter table ItemCompraAC3M4
add ValorCompra decimal (6,2) null

alter table CompraAC3M4
alter column ValorTotal decimal(6,2) not null

alter table CompraAC3M4
drop column valor

alter table CompraAC3M4
alter column [Data] datetime2 not null

alter table CompraAC3M4
add constraint dfDatComp default (getdate()) for [Data]