

 CREATE TABLE Cliente
(
    Codigo INT IDENTITY (1,1),
    Nome VARCHAR (50) NOT NULL,
    CPF CHAR (11) NULL, 
    Email VARCHAR (80) NULL,
    Celular CHAR (11) NULL,
    Telefone_Residencial CHAR (10) NULL,
    CEP CHAR (8) NULL,
    Logradouro VARCHAR (50) NULL,
    Cidade VARCHAR (50) NULL,
    Estado VARCHAR (30) NULL,
    CONSTRAINT PK_ClienteCodigo PRIMARY KEY(Codigo),

    )

  


 CREATE TABLE Fidelidade
 (
     Codigo_Cliente INT,
     Data_Adesao DATETIME,
     Pontos INT
     CONSTRAINT PK_CodigoCliente PRIMARY KEY (Codigo_Cliente),
     CONSTRAINT FK_ClienteFidelidade FOREIGN KEY (Codigo_Cliente) 
     REFERENCES Cliente(Codigo)

 )


BEGIN TRANSACTION

CREATE TABLE Forma_de_Pagamento
(
    Codigo_Pagamento INT IDENTITY (1,1),
    Nome VARCHAR (30) NOT NULL,
    Descricao VARCHAR (30) NULL,
    Tipo VARCHAR (30) NOT NULL,
    CONSTRAINT PK_CodigoPagamento PRIMARY KEY(Codigo_Pagamento),

)

COMMIT

BEGIN TRANSACTION

CREATE TABLE Venda
(
    Codigo_Venda INT IDENTITY (1,1),
    Valor DECIMAL (5,2) NOT NULL,
    Valor_Imposto DECIMAL (3,2) NULL,
    Data_Venda DATETIME NOT NULL,
    Nota_Fiscal INT NULL,
    Codigo_Cliente INT NOT NULL,
    Pagamento_Venda INT NOT NULL,
    CONSTRAINT PK_CodigoVenda PRIMARY KEY(Codigo_Venda),
    CONSTRAINT FK_CodigoVendaCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo),
    CONSTRAINT FK_CodigoFormaDePagamento FOREIGN KEY (Pagamento_Venda)
    REFERENCES Forma_de_Pagamento(Codigo_Pagamento)

)

COMMIT

BEGIN TRANSACTION 

CREATE TABLE Marca
(
    Codigo_Marca INT IDENTITY,
    Nome VARCHAR (50) NOT NULL,
    Empresa VARCHAR (50) NULL,
    CONSTRAINT PK_CodigoMarca PRIMARY KEY (Codigo_Marca)

)

COMMIT

BEGIN TRANSACTION

CREATE TABLE Produto
(
    Codigo_Produto INT IDENTITY,
    Nome VARCHAR (50) NOT NULL,
    Descricao VARCHAR (100) NULL,
    CONSTRAINT PK_CodigoProduto PRIMARY KEY (Codigo_Produto)


)



ALTER TABLE Produto
ADD CONSTRAINT FK_MarcaProduto FOREIGN KEY (Marca_Produto) REFERENCES Marca (Codigo_Marca)

COMMIT

BEGIN TRANSACTION

CREATE TABLE Pedido_Venda 
(
    Codigo_Pedido INT IDENTITY,
    Valor_Unitario DECIMAL (5,2) NOT NULL,
    Quantidade INT NOT NULL,
    Valor_Imposto DECIMAl (3,2) NULL,
    Valor_Total DECIMAL (5,2) NOT NULL,
    Venda_Produto INT NOT NULL,
    Numero_Venda INT NOT NULL,
    CONSTRAINT PK_CodigoPedido PRIMARY KEY (Codigo_Pedido),
    CONSTRAINT FK_CodigoVendaProduto FOREIGN KEY (Venda_Produto) REFERENCES Produto(Codigo_Produto),
    CONSTRAINT FK_NumeroVenda FOREIGN KEY (Numero_Venda) REFERENCES Venda (Codigo_Venda)
    
)

COMMIT 

BEGIN TRANSACTION

CREATE TABLE Distribuidor
(
    Codigo_Distribuidor INT IDENTITY (1,1),
    Nome_Fantasia VARCHAR (30) NOT NULL,
    Razao_Social VARCHAR (50) NOT NULL,
    CNPJ INT NOT NULL,
    Email VARCHAR (80) NULL,
    Telefone1 VARCHAR (15) NOT NULL,
    Telefone2 VARCHAR (15) NULL,
    CEP CHAR (8) NULL,
    Logradouro VARCHAR (50) NULL,
    Cidade VARCHAR (50) NULL,
    Estado VARCHAR (30) NULL, 
    CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo_Distribuidor)
)

COMMIT


BEGIN TRANSACTION

CREATE TABLE Compra
(
    Codigo_Compra INT IDENTITY,
    Valor DECIMAL (6,2) NOT NULL,
    Valor_Imposto DECIMAL (4,2) NULL,
    Data_Compra DATETIME NOT NULL,
    Nota_Fiscal INT NULL,
    Distribuidor_Num INT NOT NULL,
    CONSTRAINT PK_CodigoCompra PRIMARY KEY (Codigo_Compra),
    CONSTRAINT FK_NumeroDistribuidor FOREIGN KEY (Distribuidor_Num) REFERENCES Distribuidor(Codigo_Distribuidor)
    
)

COMMIT

BEGIN TRANSACTION

CREATE TABLE Pedido_Compra
(
    Numero_Pedido INT NOT NULL,
    Valor_Unitario DECIMAL (5,2) NOT NULL,
    Quantidade INT NOT NULL,
    Valor_Total DECIMAL (6,2) NOT NULL,
    Compra_Produto INT NOT NULL,
    Numero_Compra INT NOT NULL,
    CONSTRAINT PK_NumeroCompra PRIMARY KEY (Numero_Pedido),
    CONSTRAINT FK_CompraProduto FOREIGN KEY (Compra_Produto) REFERENCES Produto(Codigo_Produto),
    CONSTRAINT FK_PedidoCompra FOREIGN KEY (Numero_Compra) REFERENCES Compra(Codigo_Compra)

)



COMMIT

