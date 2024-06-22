

CREATE TABLE ator
(
	cod_ator SERIAL PRIMARY KEY,
	nome VARCHAR(60)
)


CREATE TABLE genero
(
	cod_gen SERIAL PRIMARY KEY,
	nome VARCHAR(60)
)



CREATE TABLE categoria
(
	cod_cat SERIAL PRIMARY KEY,
	nome VARCHAR(60),
	valor MONEY
)


CREATE TABLE filmes
(
	cod_filme SERIAL PRIMARY KEY,
	titulo_original VARCHAR(100),
	TITULO VARCHAR(100),
	quantidade int,
	fk_cod_cat INTEGER NOT NULL,
	fk_cod_gen INTEGER NOT NULL,
	FOREIGN KEY (fk_cod_cat) REFERENCES categoria(cod_cat),
	FOREIGN KEY (fk_cod_gen) REFERENCES genero(cod_gen)
)

	
CREATE TABLE filme_ator
(
	fk_cod_ator INTEGER NOT NULL,
	fk_cod_filme INTEGER NOT NULL,
	ator VARCHAR(3),
	diretor VARCHAR(3)
)

	
CREATE TABLE ENDERECO
(
	cod_end SERIAL PRIMARY KEY,
	logradouro varchar(40),
	tipo_log VARCHAR(40),
	complemento VARCHAR(20),
	cidade VARCHAR(60),
	UF VARCHAR(2),
	cep VARCHAR(8),
	numero VARCHAR(10),
	bairro VARCHAR(60)
)


CREATE TABLE profissao
(
	cod_prof SERIAL PRIMARY KEY,
	nome VARCHAR(60)
)



CREATE TABLE cliente
(
	cod_cli SERIAL PRIMARY KEY,
	cpf VARCHAR(11),
	nome VARCHAR(60),
	telefone VARCHAR(10),
	fk_cod_prof INTEGER NOT NULL,
	FOREIGN KEY(fk_cod_prof) REFERENCES profissao(cod_prof)
)



CREATE TABLE cli_endereco
(
	fk_cod_end INTEGER NOT NULL,
	fk_cod_cli INTEGER NOT NULL,
	FOREIGN KEY (fk_cod_end) REFERENCES endereco(cod_end),
	FOREIGN KEY (fk_cod_cli) REFERENCES cliente(cod_cli)
)

CREATE TABLE dependente
(
	fk_cod_cli INTEGER NOT NULL,
	fk_cod_dep INTEGER NOT NULL,
	parentesco VARCHAR(20),
	PRIMARY KEY (fk_cod_cli, fk_cod_dep),
	FOREIGN KEY (fk_cod_cli) REFERENCES cliente(cod_cli),
	FOREIGN KEY (fk_cod_dep) REFERENCES cliente(cod_cli)
)

CREATE TABLE locacao
(
	cod_loc SERIAL PRIMARY KEY,
	data_loc DATE,
	desconto MONEY,
	multa MONEY,
	sub_total MONEY,
	fk_cod_cli INTEGER NOT NULL,
	FOREIGN KEY (fk_cod_cli) REFERENCES cliente(cod_cli)
)


CREATE TABLE locacao_filme
(
	fk_cod_loc INTEGER NOT NULL,
	fk_cod_filme INTEGER NOT NULL,
	valor MONEY,
	num_dias INT,
	data_devol DATE,
	FOREIGN KEY (fk_cod_loc) REFERENCES locacao(cod_loc),
	FOREIGN KEY (fk_cod_filme) REFERENCES filmes(cod_filme)
)



SELECT * FROM ator
SELECT * FROM genero
SELECT * FROM categoria
SELECT * FROM filmes
SELECT * FROM endereco
SELECT * FROM profissao
SELECT * FROM cliente
SELECT * FROM cli_endereco
SELECT * FROM dependente
SELECT * FROM locacao
SELECT * FROM locacao_filme
SELECT * FROM filme_ator

/*
Cadastrar 15 filmes
10 clientes
20 locações
*/

--Populando a tabela ator

INSERT INTO ator (nome) VALUES ('Tom Hanks');

INSERT INTO ator (nome) VALUES ('Meryl Streep');

INSERT INTO ator (nome) VALUES ('Leonardo DiCaprio');

INSERT INTO ator (nome) VALUES ('Jennifer Lawrence');

INSERT INTO ator (nome) VALUES ('Denzel Washington');


--Populando a tabela categoria
INSERT INTO categoria (nome, valor) VALUES ('Aventura', 10.99);

INSERT INTO categoria (nome, valor) VALUES ('Comédia Romântica', 9.99);

INSERT INTO categoria (nome, valor) VALUES ('Suspense', 12.50);

INSERT INTO categoria (nome, valor) VALUES ('Animação', 8.99);

INSERT INTO categoria (nome, valor) VALUES ('Fantasia', 11.25);


--Populando a tabela endereco

INSERT INTO ENDERECO (logradouro, tipo_log, complemento, cidade, UF, cep, numero, bairro)
VALUES ('Rua das Flores', 'Rua', 'Apto 101', 'São Paulo', 'SP', '01020304', '100', 'Centro');

INSERT INTO ENDERECO (logradouro, tipo_log, complemento, cidade, UF, cep, numero, bairro)
VALUES ('Avenida dos Bandeirantes', 'Avenida', 'Casa 2', 'Rio de Janeiro', 'RJ', '20030040', '500', 'Copacabana');

INSERT INTO ENDERECO (logradouro, tipo_log, complemento, cidade, UF, cep, numero, bairro)
VALUES ('Rua das Palmeiras', 'Rua', 'Sobrado', 'Curitiba', 'PR', '80040080', '300', 'Batel');

INSERT INTO ENDERECO (logradouro, tipo_log, complemento, cidade, UF, cep, numero, bairro)
VALUES ('Avenida Paulista', 'Avenida', 'Bloco B', 'São Paulo', 'SP', '01311301', '900', 'Bela Vista');

INSERT INTO ENDERECO (logradouro, tipo_log, complemento, cidade, UF, cep, numero, bairro)
VALUES ('Rua do Comércio', 'Rua', 'Loja 1', 'Porto Alegre', 'RS', '90010150', '200', 'Centro');


--Populando a tabela profissao

INSERT INTO profissao (nome) VALUES ('Engenheiro');

INSERT INTO profissao (nome) VALUES ('Professor');

INSERT INTO profissao (nome) VALUES ('Médico');

INSERT INTO profissao (nome) VALUES ('Advogado');

INSERT INTO profissao (nome) VALUES ('Designer');


--Populando a tabela cliente

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('12345678901', 'João Silva', '999990000', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('98765432109', 'Maria Santos', '999991111', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('45678912345', 'Pedro Oliveira', '999992222', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('78912345678', 'Ana Souza', '999993333', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('32165498732', 'Carlos Costa', '999994444', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('65498732165', 'Juliana Lima', '999995555', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('98732165498', 'Lucas Oliveira', '999996666', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('14725836900', 'Gabriela Santos', '999997777', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('36925814700', 'Rafaela Silva', '999998888', FLOOR(RANDOM() * 5) + 1);

INSERT INTO cliente (cpf, nome, telefone, fk_cod_prof)
VALUES ('25836914700', 'Fernando Souza', '999999999', FLOOR(RANDOM() * 5) + 1);

--Populando a tabela genero
INSERT INTO genero (nome) VALUES ('Ação');

INSERT INTO genero (nome) VALUES ('Comédia');

INSERT INTO genero (nome) VALUES ('Drama');

INSERT INTO genero (nome) VALUES ('Romance');

INSERT INTO genero (nome) VALUES ('Ficção Científica');


--Populando a tabela locacao_filme

INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (1, 3, 15.00, 3, '2024-06-21');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (2, 5, 20.00, 5, '2024-06-22');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (3, 2, 12.00, 2, '2024-06-23');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (4, 4, 18.00, 4, '2024-06-24');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (5, 1, 10.00, 1, '2024-06-25');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (6, 6, 22.00, 6, '2024-06-26');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (7, 7, 25.00, 7, '2024-06-27');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (8, 8, 30.00, 8, '2024-06-28');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (9, 9, 35.00, 9, '2024-06-29');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (10, 10, 40.00, 10, '2024-06-30');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (11, 11, 45.00, 11, '2024-07-01');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (12, 12, 50.00, 12, '2024-07-02');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (13, 13, 55.00, 13, '2024-07-03');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (14, 14, 60.00, 14, '2024-07-04');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (15, 15, 65.00, 15, '2024-07-05');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (16, 1, 70.00, 16, '2024-07-06');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (17, 2, 75.00, 17, '2024-07-07');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (18, 3, 80.00, 18, '2024-07-08');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (19, 4, 85.00, 19, '2024-07-09');
INSERT INTO locacao_filme (fk_cod_loc, fk_cod_filme, valor, num_dias, data_devol) VALUES (20, 5, 90.00, 20, '2024-07-10');


--Populando a tabela filme_ator
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (1, 3, 'SIM', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (2, 5, 'NÃO', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (3, 7, 'SIM', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (4, 9, 'NÃO', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (5, 11, 'SIM', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (1, 13, 'NÃO', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (2, 15, 'SIM', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (3, 1, 'NÃO', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (4, 3, 'SIM', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (5, 5, 'NÃO', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (1, 7, 'SIM', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (2, 9, 'NÃO', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (3, 11, 'SIM', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (4, 13, 'NÃO', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (5, 15, 'SIM', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (1, 2, 'NÃO', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (2, 4, 'SIM', 'NÃO');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (3, 6, 'NÃO', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (4, 8, 'SIM', 'SIM');
INSERT INTO filme_ator (fk_cod_ator, fk_cod_filme, ator, diretor) VALUES (5, 10, 'NÃO', 'NÃO');

--Consultando tabelas
/*
1  - Listar todos os filmes alugados por um cliente específico, incluindo a data de locação e a data de devolução.
*/



SELECT
    cliente.nome AS Nome_cliente,
    filmes.titulo AS Titulo_do_filme,
    locacao.data_loc AS Data_locacao,
    locacao_filme.data_devol AS Data_devolucao
FROM
    cliente 
JOIN
    locacao  ON cliente.cod_cli = locacao.fk_cod_cli
JOIN
    locacao_filme ON locacao.cod_loc = locacao_filme.fk_cod_loc
JOIN
    filmes ON locacao_filme.fk_cod_filme = filmes.cod_filme
WHERE
    cliente.cod_cli = 1;

