--USE master;
--IF DB_ID('teste2')<>0
--   DROP DATABASE teste2;
--CREATE DATABASE teste2;
--GO
--USE TESTE2;
----------------------------------------------------------------------------------------------------TABELA CLIENTE--------------------------------------------------------------------------------------------------------------
--CREATE TABLE Cliente (
--    Cli_CPF         CHAR(11) PRIMARY KEY NOT NULL,
--    Cli_Nome        VARCHAR(50) NOT NULL,
--    Cli_Sexo        CHAR(1)	NOT NULL CHECK (Cli_Sexo IN ('M', 'F')),
--    Cli_CEP         VARCHAR(8)	NOT NULL,
--    Cli_Logradouro  VARCHAR(50)	NOT NULL,
--    Cli_Numero      VARCHAR(10)	NOT NULL,
--    Cli_Complemento CHAR(50)	DEFAULT 'OPCIONAL',
--    Cli_Bairro		VARCHAR(30) NOT NULL,
--    Cli_Cidade      VARCHAR(30)	NOT NULL,
--    Cli_Estado      CHAR(2)		NOT NULL,
--    Cli_Telefone    CHAR(15)	NOT NULL,
--    Cli_Email       VARCHAR(30) UNIQUE
--);
----------------------------------------------------------------------------------------------------TABELA PEDIDO----------------------------------------------------------------------------------------------------------------
--CREATE TABLE Pedido (Ped_Numero  INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
--					 Cli_CPF     CHAR(11),
--					 Ped_Data    DATE,
--					 FOREIGN KEY (Cli_CPF) REFERENCES Cliente(Cli_CPF));


----------------------------------------------------------------------------------------------------TABELA PRODUTO--------------------------------------------------------------------------------------------------------------
--CREATE TABLE Produto (	Prd_Codigo         INTEGER PRIMARY KEY IDENTITY(1000,10),
--						Descricao			VARCHAR(50) NOT NULL,
--						Prd_undFornecimento VARCHAR(10) NOT NULL,
--						Prd_Estoque_Min    INT CHECK(Prd_Estoque_Min > 0),
--						Prd_Estoque_Atual  INTEGER);


----------------------------------------------------------------------------------------------------TABELA FORNECEDOR-----------------------------------------------------------------------------------------------------------
--CREATE TABLE Fornecedor (Frn_CNPJ         CHAR(14) PRIMARY KEY,
--						 Frn_Razao_Social CHAR(50)		NOT NULL,
--						 Frn_Logradouro	  VARCHAR(50)	NOT NULL,
--						 Frn_Numero       CHAR(10)		NOT NULL,
--						 Frn_Complemento  VARCHAR(50)	DEFAULT'OPCIONAL',
--						 Frn_Bairro       VARCHAR(30)	NOT NULL,
--						 Frn_Cidade       VARCHAR(30)	NOT NULL,
--						 Frn_Estado       CHAR(2)		NOT NULL,
--						 Frn_Cep          CHAR(8)		 NOT NULL,
--						 Frn_Email        VARCHAR(30)	UNIQUE,
--						 Frn_Telefone     CHAR(15));



------------------------------------------------------------------------------------------------------------TABELA PAGAMENTO------------------------------------------------------------------------------------------------------
--CREATE TABLE Pagamento (Pg_Codigo INTEGER PRIMARY KEY IDENTITY(1000, 10),
--						Ped_Numero INT,
--						Pg_Data DATE NOT NULL,
--						Pg_Valor DECIMAL(10,2) NOT NULL,
--						FOREIGN KEY (Ped_Numero) REFERENCES Pedido(Ped_Numero));

--------------------------------------------------------------------------------------------------TABELAS DE RELACIONAMENTO------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------TABELA PedidoProduto------------------------------------------------------------------------------------------------------
--CREATE TABLE PedidoProduto (Ped_Numero   INTEGER NOT NULL,
--							Prd_Codigo   INTEGER NOT NULL,
--							Quantidade   INTEGER NOT NULL,
--							Preco        DECIMAL(10,2) NOT NULL,
--							PRIMARY KEY (Prd_Codigo, Ped_Numero),
--							FOREIGN KEY (Ped_Numero) REFERENCES Pedido(Ped_Numero),
--							FOREIGN KEY (Prd_Codigo) REFERENCES Produto(Prd_Codigo));
--------------------------------------------------------------------------------------------------TABELA ProdutoFornecedor------------------------------------------------------------------------------------------------------
--CREATE TABLE ProdutoFornecedor (Prd_Codigo    INTEGER NOT NULL,
--								Frn_Cnpj	  CHAR(14),
--								PRIMARY KEY (Frn_CNPJ, Prd_Codigo),
--								FOREIGN KEY (Frn_CNPJ) REFERENCES Fornecedor(Frn_CNPJ),
--								FOREIGN KEY (Prd_Codigo) REFERENCES Produto(Prd_Codigo));



----------------------------------------------------------------------------------------------------TABELA PAGAMENTO_CARTAO----------------------------------------------------------------------------------------------------------CREATE TABLE PagamentoCartao (Nr_Cartao			 CHAR(16) PRIMARY KEY,
--CREATE TABLE PagamentoCartao (Nr_Cartao		   CHAR(16) PRIMARY KEY,
--								 Pg_Codigo     INTEGER NOT NULL,
--								 Nome_Titular  CHAR(50) NOT NULL,
--					    		 Validade      DATE NOT NULL,
--								 Cd_Seguranca  CHAR(3) NOT NULL,
--								 Nr_Parcelas   INTEGER NOT NULL,
--								 FOREIGN KEY (Pg_Codigo) REFERENCES Pagamento(Pg_Codigo));



----------------------------------------------------------------------------------------------------TABELA PAGAMENTO_CHEQUE------------------------------------------------------------------------------------------------------
--CREATE TABLE PagamentoCheque (Nr_Cheque     INTEGER PRIMARY KEY,
--							  Pg_Codigo     INTEGER,
--							  Banco         VARCHAR(10) NOT NULL,
--							  Agencia       CHAR(5) NOT NULL,
--							  Valor         MONEY,
--							  FOREIGN KEY (Pg_Codigo) REFERENCES Pagamento(Pg_Codigo));

------------------------------------------------------------------------------INSERÇÃO DE DADOS COMEÇA AQUI----------------------------------------------------------------------------------------------------------------------

----------Inserimento de dados na TABELA: Cliente

--INSERT INTO Cliente (Cli_CPF, Cli_Nome, Cli_Sexo, Cli_CEP, Cli_Logradouro, Cli_Numero, Cli_Complemento, Cli_Bairro, Cli_Cidade, Cli_Estado, Cli_Telefone, Cli_Email)
--            VALUES	('12345678902', 'Vinicius Pereira', 'M', '12345679', 'Rua das Aguas', '321', NULL, 'Baixo', 'Recife', 'PE', '(81) 94002-8922', 'vinicius2407@hotmail.com'),
--				    ('12345678901', 'Ana Santos', 'F', '50000100', 'Rua das Flores', '123', 'Apto 101', 'Boa Viagem', 'Recife', 'PE', '(81) 98765-4321', 'aninha@outlook.com'),
--				    ('12345678905', 'Lionel Messi', 'M', '50000110', 'Rua do GOAT', '110', 'Apto 110', 'Rosario', 'Buenos Aires', 'AR', '(54) 91030-7719', 'melhordomundo@outlook.com'),
--                    ('98765432101', 'João Lima', 'M', '51000200', 'Avenida Principal', '456', NULL, 'Centro', 'Recife', 'PE', '(81) 91234-5678', 'joao_modric@gmail.com'),
--                    ('65498732101', 'Mariana Silva', 'F', '52000300', 'Rua do Comércio', '789', NULL, 'Encruzilhada', 'Recife', 'PE', '(81) 92345-6789', 'marianaGatinha@yahoot.com'),
--                    ('12398745601', 'Pedro Almeida', 'M', '53000400', 'Rua das Palmeiras', '456', 'Casa 3', 'Casa Forte', 'Recife', 'PE', '(81) 90123-4567', 'pedraoMessi03@outlook.com'),
--                    ('45612378901', 'Carla Souza', 'F', '54000500', 'Avenida dos Coqueiros', '789', NULL, 'Parnamirim', 'Recife', 'PE', '(81) 93456-7890', 'carla22@gmail.com'),
--                    ('78945612301', 'José Pereira', 'M', '55000600', 'Rua do Mar', '123', 'Apto 302', 'Pina', 'Recife', 'PE', '(81) 94567-8901', 'josepereira@hotmail.com');

--SELECT * FROM Cliente

-----------------------------------------------------------------------------Inserção de dados na TABELA: Pedido------------------------------------------------------------------------------------------------------------

--INSERT INTO Pedido (Cli_CPF, Ped_Data)
--VALUES			('12345678901', '2023-05-18'),
--				('12345678905', '2023-05-18'),
--				('12345678902', '2023-05-17'),
--				('98765432101', '2023-05-19'),
--				('65498732101', '2023-05-18'),
--				('45612378901', '2023-05-15'),
--				('12398745601', '2023-05-01'),
--				('78945612301', '2023-05-14');

--SELECT * FROM Pedido


------------------------------------------------------------------------------Inserção de dados na tabela Produto------------------------------------------------------------------------------------------------------------

--INSERT INTO Produto (Descricao, Prd_undFornecimento, Prd_Estoque_Min, Prd_Estoque_Atual)
--VALUES				
--					('Processador Intel Core I9-13900KF', 'Unidade', 1, 10),
--					('Placa de Video NVIDIA GeForce RTX 4090', 'Unidade', 1, 5),
--					('Memória RAM Corsair Vengeance 16GB 3200MHZ', 'Unidade', 4, 30),
--					('SSD NVME Samsung 1TB ', 'Unidade', 1, 15),
--					('Fonte de Alimentação Corsair 750W', 'Caixa', 10, 60),
--					('Placa-Mãe ASUS ROG Strix Z590-E Gaming', 'Caixa', 5, 20),
--					('Gabinete Rise Mode Galaxy Glass', 'Pacote', 1, 15),
--					('Teclado HyperX Mars RGB', 'Pacote', 1, 50),
--					('Monitor Samsung Odyssey 34",WQHD,165Hz', 'Unidade', 1,10),
--					('Processador AMD Ryzen 9 5900X', 'Caixa', 1, 15),
--					('Water Cooler Z 240 Rise Mode Frost', 'Caixa', 1, 10),
--					('Controle Sony DualSense PS5', 'Pacote', 1, 100),
--					('Fone ASTRO A50', 'Caixa', 1, 5),
--					('Console Sony Playstation 5','Unidade', 1, 10),
--					('Console Nintendo Switch', 'Pacote', 1, 25),
--					('Console Xbox Series X', 'Unidade', 1, 10),
--					('Mouse HyperX FPS Pro', 'Pacote', 1, 20);

--SELECT * FROM Produto


----------------------------------------------------------------------------------Inserção de dados na TABELA: PedidoProduto----------------------------------------------------------------------------------------------------

--INSERT INTO PedidoProduto (Ped_Numero, Prd_Codigo, Quantidade, Preco)
--VALUES					(1, 1130, 1, 4400.99),
--						(1, 1120, 1, 2199.99),
--					 	(1, 1110, 1, 300.99),
--					 	(2, 1020, 4, 800.00),
--					 	(3, 1010, 1, 15000.00),
--					 	(4, 1070, 1, 325.00),
--						(4, 1160, 1, 250.00),
--						(5, 1080, 2, 5999.80),
--						(5, 1100, 1, 389.99),
--						(6, 1050, 1, 1999.00),
--						(7, 1140, 1, 2099.99),
--						(8, 1000, 1, 3749.99);
--SELECT * FROM PedidoProduto
--------------------------------------------------------------------------------------Inserção de dados na TABELA: Fornecedor----------------------------------------------------------------------------------------------------

--INSERT INTO Fornecedor (Frn_CNPJ, Frn_Razao_Social, Frn_Logradouro, Frn_Numero, Frn_Complemento, Frn_Bairro, Frn_Cidade, Frn_Estado, Frn_Cep, Frn_Email, Frn_Telefone)
--            VALUES	   ('49876543210123', 'NVIDIA Brasil', 'Só Placa Braba', '240', 'Bloco XX', 'Parque Industrial', 'Amazonas', 'AM', '77777777', 'supportNVIDIA@outlook.com', '(11) 97770-7777'),
--				       ('19876543210123', 'Corsair Brasil', 'Aliada da Qualidade', '003', 'Bloco X', 'Parque Industrial', 'Amazonas', 'AM', '11143111', 'supportCorsair@gmail.com', '(11) 99390-1341'),
--					   ('29876543210123', 'Rise Mode', 'Gabinetes Lindos', '005', 'Bloco XX', 'Avenida Paulista', 'São Paulo', 'SP', '11122111', 'Risemode@outlook.com', '(11) 99290-1346'),
--					   ('39876543210123', 'AMD Brasil', 'Aliada da Integrada', '777', 'Bloco O', 'Rua do Video', 'São Paulo', 'SP', '22255111', 'AMDbrasil@gmail.com', '(11) 99490-1340'),
--					   ('09876543210123', 'Intel Brasil', 'Inimiga do Overclock', '001', 'Bloco C', 'Parque Industrial', 'Amazonas', 'AM', '11144111', 'intelbrasil@gmail.com', '(11) 99090-1340'),
--				 	   ('01234567890132', 'Asus Brasil', 'Fez a boa com a TUF', '002', 'Bloco Z', 'Parque Industrial', 'Amazonas', 'AM', '22244122', 'asusBrsup@outlook.com', '(11) 99101-1531'),
--					   ('12345678901234', 'Sony Brasil LTDA', 'Inocencio Tobias', '131', 'Bloco A', 'Parque Industrial', 'São Paulo', 'SP', '01144000', 'SonyBrasil@outlook.com', '(11) 93878-8101'),
--					   ('98765432101234', 'LogiTech Brasil', 'Avenida Principal', '456', NULL, 'Centro', 'Recife', 'PE', '51000000', 'LogitechBr@gmail.com', '(81) 91234-5678'),
--					   ('65498732101234', 'HP Brasil', 'Alameda Xingu', '350', NULL, 'Barueri', 'Sao Paulo', 'SP', '06455030', 'hp_care@hyperx.com', '(11) 92933-7986'),
--					   ('12398745601234', 'Samsung ', 'Rua das Palmeiras', '456', 'Casa 3', 'Casa Forte', 'Recife', 'PE', '53000000', 'Samsung_brasil@outlook.com', '(81) 90123-4567'),
--					   ('45612378901234', 'Nintendo', 'Qualquer rua do Japao', '789', NULL, 'Asakusa', 'Tokyo', 'JP', '54000000', 'piratearNintendo@fazbem.com', '(81) 93456-7890'),
--					   ('78945612301234', 'Microsoft', 'O Melhor Lugar do mundo', '987', NULL, 'Meu Coração', 'Vinicius', 'VI', '55000000', 'euamoamicrosoft@<4.com', '(81) 90432-1532');
--SELECT * FROM Fornecedor

--------------------------------------------------------------------------------------Inserção de dados na TABELA: FornecedorProduto--------------------------------------------------------------------------------------------

--INSERT INTO ProdutoFornecedor (Prd_Codigo, Frn_Cnpj)
--                       VALUES (1000, '09876543210123'),
--                              (1010, '49876543210123'),
--                              (1020, '19876543210123'),
--	                          (1030, '12398745601234'),
--	                          (1040, '19876543210123'),
--	                          (1050, '01234567890132'),
--	                          (1060, '29876543210123'),
--	                          (1070, '65498732101234'),
--	                          (1080, '12398745601234'),
--	                          (1090, '39876543210123'),
--	                          (1100, '29876543210123'),
--	                          (1110, '12345678901234'),
--	                          (1120, '98765432101234'),
--	                          (1130, '12345678901234'),
--	                          (1140, '45612378901234'),
--	                          (1150, '78945612301234'),
--	                          (1160, '65498732101234');

--SELECT * FROM ProdutoFornecedor

--------------------------------------------------------------------------------------Inserção de dados na TABELA: Pagamento--------------------------------------------------------------------------------------

--INSERT INTO Pagamento (Ped_Numero, Pg_Data, Pg_Valor)
--VALUES		(1, '2023-05-18', 6901.97),
--			(2, '2023-05-19', 800.00),
--			(3, '2023-05-16', 15000.00),
--			(4, '2023-05-19', 575.00),
--			(5, '2023-05-18', 6389.79),
--			(6, '2023-05-15', 1999.00),
--			(7, '2023-05-01', 2099.99),
--			(8, '2023-05-14', 3749.99);

--SELECT * FROM Pagamento

----------------------------------------------------------------------------------------Inserção de dados na TABELA: PagamentoCartao---------------------------------------------------------------------------------------------------------------

--INSERT INTO PagamentoCartao (Nr_Cartao, Pg_Codigo, Nome_Titular, Validade, Cd_Seguranca, Nr_Parcelas)
--VALUES 
--	(1234567890777777, 1000, 'Ana Santos', '2024-12-31', '456', 2),
--	(5489262955894541, 1010, 'Lionel Messi', '2027-12-31', '789', 4),
--    (2407200318122022, 1020, 'Vinicius Pereira', '2025-12-31', '123', 2),
--	(4310494059023941, 1030, 'João Lima', '2028-12-31', '345', 10);


--SELECT * FROM PagamentoCartao

----------------------------------------------------------------------------------------Inserção de dados na TABELA: PagamentoCheque---------------------------------------------------------------------------------------------------------------


--INSERT INTO PagamentoCheque (Nr_Cheque, Pg_Codigo, Banco, Agencia, Valor)
--VALUES 
--    (1001, 1040, 'NuBank', '12345', 6389.79),
--	(4020, 1050, 'Bradesco', '67890', 1999.00),
--	(3784, 1060, 'Caixa', '32457', 2099.99);

------------------------------------------------------------------------------------------COMANDOS Consultas-----------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------Comandos AS/ALIAS------------------------------------------------------------------------------------------------------------------------
--SELECT Prd_Codigo, Descricao, Prd_Estoque_Atual AS Estoque
--FROM Produto;

--------------------------------------------------------------------------------------------Comando JOIN--------------------------------------------------------------------------------------------------------------------------
--SELECT Pedido.Ped_Numero, Pedido.Ped_Data, Produto.Descricao, PedidoProduto.Quantidade, PedidoProduto.Preco
--FROM PedidoProduto
--JOIN Pedido ON PedidoProduto.Ped_Numero = Pedido.Ped_Numero
--JOIN Produto ON PedidoProduto.Prd_Codigo = Produto.Prd_Codigo
--ORDER BY Pedido.Ped_Numero ASC;

----Detalha o Pedido mais especificadamente, o dando em ordem CRESCENTE



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Aqui meu CONSIDERADO tu ve o nome do cliente, as vezes que ele pediu e o Consumo TOTAL
--SELECT P.Ped_Numero, C.Cli_Nome, SUM(PP.Quantidade * PP.Preco) AS 'Valor Total'
--FROM Pedido P
--INNER JOIN Cliente C ON P.Cli_CPF = C.Cli_CPF
--INNER JOIN PedidoProduto PP ON P.Ped_Numero = PP.Ped_Numero
--GROUP BY P.Ped_Numero, C.Cli_Nome;


----Exemplo de MAX/MIN
----SELECT P.Prd_Codigo, P.Descricao, P.Prd_Estoque_Atual, P.Prd_Estoque_Min
----FROM Produto P;



--SELECT Cli_CPF, COUNT(*) AS Total_Pedidos
--FROM Pedido
--GROUP BY Cli_CPF;
--Essa consulta irá retornar o CPF do cliente e o total de pedidos que ele fez. Cada linha da saída representará um cliente diferente, mostrando o CPF e o número total de pedidos para cada cliente.



--Nesse aqui ele te da a media de preço--
--SELECT c.Cli_Nome AS NomeCliente, p.Ped_Data AS DataPedido, COUNT(pp.Ped_Numero) AS TotalProdutos, SUM(pp.Preco) AS ValorTotal, AVG(pp.Preco) AS MediaPreco
--FROM Cliente c
--JOIN Pedido p ON c.Cli_CPF = p.Cli_CPF
--JOIN PedidoProduto pp ON p.Ped_Numero = pp.Ped_Numero
--GROUP BY c.Cli_Nome, p.Ped_Data;


---------------------------------------------------------------------------------------------TRIGGER-------------------------------------------------------------------------------------------------------------------------------


--CREATE TRIGGER TRG_AtualizaEstoque
--ON PedidoProduto
--AFTER INSERT
--AS
--BEGIN
----     Atualiza o estoque para cada produto inserido no pedido
--    UPDATE Produto
--    SET Prd_Estoque_Atual = Prd_Estoque_Atual - i.Quantidade
--    FROM Produto
--    INNER JOIN inserted i ON Produto.Prd_Codigo = i.Prd_Codigo;
--END;
---------------------------------------------------------------------------------------------PROCEDURE-----------------------------------------------------------------------------------------------------------------------------

--select * From Pedido

--CREATE PROCEDURE InserirPedido
--    @Cli_CPF CHAR(11),
--    @Ped_Data DATE,
--    @Ped_Numero INT OUTPUT
--AS
--BEGIN
--    SET NOCOUNT ON;

--     Inserir novo pedido na tabela Pedido
--    INSERT INTO Pedido (Cli_CPF, Ped_Data)
--    VALUES (@Cli_CPF, @Ped_Data);

--     Obter o número do pedido inserido
--    SET @Ped_Numero = SCOPE_IDENTITY();
--END;


--DECLARE @NumeroPedido INT;

--EXEC InserirPedido '12345678901', '2023-05-28', @NumeroPedido OUTPUT;

--SELECT @NumeroPedido AS NumeroPedido;


---------------------------------------------------------------------------------------------FUNCTION------------------------------------------------------------------------------------------------------------------------------------------------
--CREATE FUNCTION ObterQuantidadeProdutosPedido
--(
--    @Ped_Numero INT
--)
--RETURNS INT
--AS
--BEGIN
--    DECLARE @QuantidadeProdutos INT;

--    -- Obter a quantidade de produtos no pedido
--    SELECT @QuantidadeProdutos = COUNT(*)
--    FROM PedidoProduto
--    WHERE Ped_Numero = @Ped_Numero;

--    RETURN @QuantidadeProdutos;
--END;

--DECLARE @PedidoNumero INT = 3;
--DECLARE @QuantidadeProdutos INT;

--SET @QuantidadeProdutos = dbo.ObterQuantidadeProdutosPedido(@PedidoNumero);

--SELECT @QuantidadeProdutos AS QuantidadeProdutos;
--*/


--select*from Produto

--CREATE INDEX idx_Produto_Descricao ON Produto (Descricao);



--CREATE INDEX idx_Produto_Descricao ON Produto (Descricao);

--SELECT Descricao FROM Produto;