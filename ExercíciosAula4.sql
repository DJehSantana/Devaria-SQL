-- Aula 4
-- Juntando Tabelas

BEGIN TRANSACTION

SELECT
    SUM (Item.Quantidade) AS Quantidade_Venda,
    P.Nome    
FROM
    Item_Pedido_Venda AS Item
    INNER JOIN Produto AS P ON Item.Codigo_Produto = P.Codigo
GROUP BY
    P.Nome

COMMIT

-- Juntando mais que duas tabelas

BEGIN TRANSACTION

SELECT
    SUM (Item.Quantidade) AS Quantidade_Venda,
    P.Nome AS Nome_Produto, 
    M.Nome AS Nome_Marca  
FROM
    Item_Pedido_Venda AS Item
    INNER JOIN Produto AS P ON Item.Codigo_Produto = P.Codigo
    INNER JOIN Marca AS M ON M.Codigo = P.Codigo_Marca
GROUP BY
    P.Nome,
    M.Nome

COMMIT

-- Exercícios
-- 1. Trazendo clientes por nome e quantos pontos de fidelidade tem, 
-- inclusive os que tem 0 pontos.

BEGIN TRANSACTION

SELECT
    C.Nome,
    CASE 
        WHEN F.Pontos IS NULL THEN 0
        ELSE F.Pontos
    END AS Pontos_Clientes,
    C.Telefone
FROM
    Cliente AS C
    LEFT JOIN Fidelidade AS F ON C.Codigo = F.Codigo_Cliente
ORDER BY
    F.Pontos DESC

COMMIT

 -- 2. Trazendo distribuidores por nome, junto com valor de compras 
 -- (maior pra menor valor), inclusive os que não tem compras

SELECT
    D.Nome_Fantasia,
    CASE 
        WHEN SUM (PC.Valor) IS NULL THEN 0
        ELSE SUM (PC.Valor)
    END AS Valor_Compra
FROM
    Distribuidor AS D
    LEFT JOIN Pedido_Compra AS PC ON D.Codigo = PC.Codigo_Distribuidor 
GROUP BY
    D.Nome_Fantasia   
ORDER BY
    SUM (PC.Valor) DESC

-- 3. Nome dos clientes que não possuem pontos de fidelidade

SELECT
    C.Nome AS [Clientes sem Fidelidade],
    C.Celular
FROM
    Cliente AS C
    LEFT JOIN Fidelidade AS F ON C.Codigo = F.Codigo_Cliente
WHERE
    F.Pontos IS NULL

-- 4. Quais produtos nunca foram vendidos

SELECT
    P.Nome AS [Produtos não Vendidos],
    M.Nome AS Marca    
FROM
    Produto AS P
    INNER JOIN Marca AS M ON P.Codigo_Marca = M.Codigo
    LEFT JOIN Item_Pedido_Venda AS V ON P.Codigo = V.Codigo_Produto
WHERE 
    V.Quantidade IS NULL
GROUP BY
    P.Nome,
    M.Nome
    


