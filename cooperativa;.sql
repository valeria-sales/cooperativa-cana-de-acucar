CREATE DATABASE cooperativa;
USE cooperativa;

CREATE TABLE produtor (
    id_produtor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_associacao DATE
);

CREATE TABLE insumo (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATE,
    valor_total DECIMAL(10,2),
    id_produtor INT,
    FOREIGN KEY (id_produtor)
        REFERENCES produtor(id_produtor)
);

CREATE TABLE item_compra (
    id_compra INT,
    id_insumo INT,
    quantidade INT,
    valor_unitario DECIMAL(10,2),

    PRIMARY KEY(id_compra,id_insumo),

    FOREIGN KEY (id_compra)
        REFERENCES compra(id_compra),

    FOREIGN KEY (id_insumo)
        REFERENCES insumo(id_insumo)
);

CREATE TABLE mensalidade (
    id_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
    ano_referencia INT,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    status VARCHAR(20),
    id_produtor INT,

    FOREIGN KEY (id_produtor)
        REFERENCES produtor(id_produtor)
);