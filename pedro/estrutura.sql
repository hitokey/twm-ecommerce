
CREATE TABLE tb_user(
      nome VARCHAR(40),
      sobrenome VARCHAR(100),
      email VARCHAR(100),
      senha VARCHAR(30));


CREATE TABLE tb_client(
    id INT AUTO_INCREMENT,
    nome VARCHAR(40),
    sobrenome VARCHAR(40),
    senha VARCHAR(40),
    cpf VARCHAR(10),
    cidade VARCHAR(50),
    rua VARCHAR(100),
    numero VARCHAR(5),
    cep VARCHAR(7),
    PRIMARY KEY(id));

CREATE TABLE tb_produto(
    id INT AUTO_INCREMENT,
    nome VARCHAR(40),
    marca VARCHAR(40),
    valor FLOAT,
    quantidade INT,
    image VARCHAR(100),
    tamanho VARCHAR(2),
    cor VARCHAR(20),
    PRIMARY KEY(id));


   
