BEGIN TRANSACTION

--Comando MIN/MAX
SELECT
	MAX(Data_Adesao)
FROM
	Fidelidade


SELECT
	MIN(Data_Adesao)
FROM
	Fidelidade



SELECT
	MAX(Valor)
FROM
	Pedido_Compra

SELECT 
	MAX(Valor)
FROM
	Pedido_Venda
WHERE
	Data >= '2021-02-01' AND Data <= '2021-02-28'

COMMIT

--Comando COUNT

BEGIN TRANSACTION

SELECT 
	COUNT (*)
FROM
	Cliente

SELECT 
	COUNT (Valor)
FROM
	Pedido_Compra
WHERE
	Valor > 1000

SELECT
	COUNT(Codigo)
FROM
	Cliente
WHERE
	Cidade = 'São Paulo'

COMMIT

--Comando SUM

BEGIN TRANSACTION

SELECT
	SUM(Quantidade)
FROM
	Item_Pedido_Compra


SELECT
	SUM (Valor_Imposto)
FROM
	Pedido_Venda

SELECT
	SUM (Pontos)
FROM
	Fidelidade

COMMIT


--Comando AVG

BEGIN TRANSACTION

SELECT
	AVG (Valor)
FROM
	Pedido_Compra

SELECT
	AVG (Valor)
FROM
	Pedido_Venda

SELECT
	AVG (Quantidade)
FROM
	Item_Pedido_Venda

COMMIT

BEGIN TRANSACTION

SELECT
	Valor - Valor_Imposto

FROM
	Pedido_Venda

COMMIT

BEGIN TRANSACTION

SELECT
	Valor_Unitario + Valor_Imposto

FROM
	Item_Pedido_Venda

SELECT
	Pontos / 2
FROM
	Fidelidade

SELECT
	Valor  + Valor_Imposto AS [Valor Produtos + Imposto]
FROM
	Pedido_Venda

COMMIT

BEGIN TRANSACTION

SELECT 
	COUNT (*) AS Quantidade_Clientes,
	Cidade
FROM
	Cliente
GROUP BY
	Cidade

SELECT
	COUNT (*) AS Quantidade,
	Tipo 
FROM
	Forma_Pagamento
GROUP BY
	Tipo

SELECT
	SUM (Valor) AS Venda_Total,
	MONTH ([Data]) AS Mês
FROM
	Pedido_Venda
GROUP BY
	MONTH ([Data])

COMMIT

BEGIN TRANSACTION

SELECT
	CASE 
		WHEN Estado = 'SP' THEN 'Dentro de São Paulo' 
		ELSE 'Fora de São Paulo'
	END
	AS Situação,
	Nome, Estado
FROM
	Cliente

SELECT
	CASE 
		WHEN Tipo LIKE '%Cartão%' THEN 'Cartão'
		WHEN Tipo LIKE '%Refeição%' THEN 'Refeição'
		ELSE 'Outros'
	END
	AS Forma_Pagamento, Nome, Tipo
FROM
	Forma_Pagamento



