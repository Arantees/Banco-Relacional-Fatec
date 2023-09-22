Select sum(cargos.salario)
from funcionario, cargos
where funcionario.idcargos = cargos.id

(vai mostrar apenas a soma de todos salarios na tabela)
---------------------------
se for separar por cargos tem que por no select

Select cargos.descricao,
sum(cargos.salario)
from funcionario, cargos
where funcionario.idcargos = cargos.id
group by 1

(vai mostrar a soma dos salarios e separar por cargo).