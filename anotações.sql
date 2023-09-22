Count = contagem de linhas;
Sum = soma de valores; (funcção de agrupamento)

Quando usa o select, as tabelas que sao selecionadas possuim um indice, que pode ser utilizado em order by ou group by se necessário.

LPAD = preenchimento a esquerda
LPAD('texto', tamanho, 'caracter')

Apresentando: o chefe

 

"Faça um relatório que mostre todas as vendas realizadas durante o ano de 2019. Eu preciso dos nomes dos clientes, dos códigos e as datas das vendas."

 

select v.id, v.datemissao, c.nome

from venda v, cliente c

where v.idcliente = c.id

and year(v.datemissao) = 2019

 

"Faça um relatório que me mostre o faturamento mensal referente ao ano de 2019."

 

select month(v.datemissao) as 'mês', sum(iv.quantidade * iv.precounitario) as 'faturamento'

from itemvenda iv, venda v

where iv.idvenda = v.id

and year(v.datemissao) = 2019

group by month(v.datemissao)

 

"Faça um relatório que me mostre todos os produtos vendidos durante o mês de janeiro de 2019. O relatório deverá conter os nomes dos produtos, os preços de compra, as quantidades vendidas e os preços unitários."

 

select p.descricao as 'produto', iv.quantidade * iv.precounitario as 'preço de compra', iv.quantidade as 'qtde. vendida', iv.precounitario as 'preço un.'

from produto p, itemvenda iv, venda v

where p.id = iv.idproduto

and iv.idvenda = v.id

and year(v.datemissao) = 2019

and month(v.datemissao) = 1

 

"Atenção...

Faça um relatório que mostre a soma dos salários agrupados por cargo quando a soma dos salários for maior que R$ 2.500,00."

 

select c.descricao as cargo, sum(e.salario) as 'soma dos salários'

from empregado e, cargo c

where e.idcargo = c.id

group by c.descricao

having sum(e.salario) > 2500

************************************

SELECT v.id, v.datemissao,
	(SELECT COUNT(p.id) 
	FROM vendaparcelas p
	WHERE p.idvenda =v.id 
	AND p.datapagto IS NULL) AS naopagas,
(SELECT COUNT(p.id) 
	FROM vendaparcelas p
	WHERE p.idvenda =v.id 
	AND p.datapagto IS NOT NULL) AS pagas,
	
	(SELECT COUNT(p.id) 
	FROM vendaparcelas p
	WHERE p.idvenda =v.id 
	AND p.datapagto IS NOT NULL)  || '/' ||
	
	(SELECT COUNT(p.id)
	FROM	vendaparcelas p
	WHERE p.idvenda =v.id) AS parcelaspagas
FROM venda v

***************************************
update vendaparcelas 
SET datapagto = '2023-09-15'
WHERE idvenda = 2
AND parcela = 1

***************************************

