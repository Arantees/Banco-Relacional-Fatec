SELECT id,
if(char_length(nome) > 10,
		CONCAT (LEFT(nome, 10) , '...'),
		nome) soma
	FROM	pessoa;
    codigo usado para pesquisar o nome com um if que significa-
    - que quando o nome tiver mais do que 10 caracters, ele vai usar os 10 primeiro caracter e,
    adicionar '...' ao final do nome atraves da soma.
    ---------------------
