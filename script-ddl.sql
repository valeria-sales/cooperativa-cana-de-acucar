
-- =============================================
-- SISTEMA DE GESTAO DA COOPERATIVA DE CANA
-- ARQUIVO: script-ddl.sql
-- DDL - ESTRUTURA DO BANCO DE DADOS
-- =============================================

CREATE DATABASE IF NOT EXISTS SistemaCooperativa;

USE SistemaCooperativa;

-- =============================================
-- 1. TABELA PRODUTOR
-- =============================================

CREATE TABLE Produtor (
    idProdutor INT UNSIGNED NOT NULL,
    codigoProdutor VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(125) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,

    PRIMARY KEY (idProdutor)
) ENGINE=InnoDB;

-- =============================================
-- 2. TABELA USINA
-- =============================================

CREATE TABLE Usina (
    idUsina INT UNSIGNED NOT NULL,
    nomeUsina VARCHAR(125) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    cidade VARCHAR(60) NOT NULL,
    telefone VARCHAR(20),

    PRIMARY KEY (idUsina)
) ENGINE=InnoDB;

-- =============================================
-- 3. TABELA AGRONOMO
-- =============================================

CREATE TABLE Agronomo (
    idAgronomo INT UNSIGNED NOT NULL,
    nome VARCHAR(125) NOT NULL,
    registroProfissional VARCHAR(30) NOT NULL UNIQUE,
    telefone VARCHAR(20),

    PRIMARY KEY (idAgronomo)
) ENGINE=InnoDB;

-- =============================================
-- 4. TABELA INSUMO
-- =============================================

CREATE TABLE Insumo (
    idInsumo INT UNSIGNED NOT NULL,
    nomeInsumo VARCHAR(100) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    descricao TEXT,
    unidadeMedida VARCHAR(20) NOT NULL,
    precoUnitario DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (idInsumo),

    CHECK (precoUnitario >= 0)
) ENGINE=InnoDB;

-- =============================================
-- 5. TABELA ENTREGA_CANA
-- =============================================

CREATE TABLE Entrega_Cana (
    idEntrega INT UNSIGNED NOT NULL,
    dataEntrega DATE NOT NULL,
    toneladas DECIMAL(10,2) NOT NULL,
    valorPago DECIMAL(12,2) NOT NULL,
    idProdutor INT UNSIGNED NOT NULL,
    idUsina INT UNSIGNED NOT NULL,

    PRIMARY KEY (idEntrega),

    CONSTRAINT fk_entrega_produtor
        FOREIGN KEY (idProdutor)
        REFERENCES Produtor(idProdutor),

    CONSTRAINT fk_entrega_usina
        FOREIGN KEY (idUsina)
        REFERENCES Usina(idUsina),

    CHECK (toneladas > 0),
    CHECK (valorPago >= 0)
) ENGINE=InnoDB;

-- =============================================
-- 6. TABELA CONTRIBUICAO_ANUAL
-- =============================================

CREATE TABLE Contribuicao_Anual (
    idContribuicao INT UNSIGNED NOT NULL,
    anoReferencia YEAR NOT NULL,
    valorBase DECIMAL(12,2) NOT NULL,
    percentual DECIMAL(5,2) NOT NULL,
    valorContribuicao DECIMAL(12,2) NOT NULL,
    autorizado BOOLEAN NOT NULL DEFAULT FALSE,
    dataPagamento DATE,
    statusPagamento VARCHAR(20) NOT NULL,
    idProdutor INT UNSIGNED NOT NULL,
    idUsinaRepasse INT UNSIGNED,

    PRIMARY KEY (idContribuicao),

    CONSTRAINT fk_contribuicao_produtor
        FOREIGN KEY (idProdutor)
        REFERENCES Produtor(idProdutor),

    CONSTRAINT fk_contribuicao_usina
        FOREIGN KEY (idUsinaRepasse)
        REFERENCES Usina(idUsina),

    CONSTRAINT uk_contribuicao_ano
        UNIQUE (idProdutor, anoReferencia),

    CHECK (valorBase >= 0),
    CHECK (percentual >= 0 AND percentual <= 100),
    CHECK (valorContribuicao >= 0),
    CHECK (statusPagamento IN ('PENDENTE', 'PAGO', 'CANCELADO'))
) ENGINE=InnoDB;

-- =============================================
-- 7. TABELA COMPRA
-- =============================================

CREATE TABLE Compra (
    idCompra INT UNSIGNED NOT NULL,
    dataCompra DATE NOT NULL,
    statusCompra VARCHAR(20) NOT NULL DEFAULT 'ABERTA',
    idProdutor INT UNSIGNED NOT NULL,

    PRIMARY KEY (idCompra),

    CONSTRAINT fk_compra_produtor
        FOREIGN KEY (idProdutor)
        REFERENCES Produtor(idProdutor),

    CHECK (statusCompra IN ('ABERTA', 'PAGA', 'CANCELADA'))
) ENGINE=InnoDB;

-- =============================================
-- 8. TABELA ITEM_COMPRA
-- =============================================

CREATE TABLE Item_Compra (
    idCompra INT UNSIGNED NOT NULL,
    idInsumo INT UNSIGNED NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    precoPraticado DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (idCompra, idInsumo),

    CONSTRAINT fk_item_compra
        FOREIGN KEY (idCompra)
        REFERENCES Compra(idCompra),

    CONSTRAINT fk_item_insumo
        FOREIGN KEY (idInsumo)
        REFERENCES Insumo(idInsumo),

    CHECK (quantidade > 0),
    CHECK (precoPraticado >= 0)
) ENGINE=InnoDB;

-- =============================================
-- 9. TABELA VISITA_TECNICA
-- =============================================

CREATE TABLE Visita_Tecnica (
    idVisita INT UNSIGNED NOT NULL,
    dataVisita DATE NOT NULL,
    observacoes TEXT NOT NULL,
    recomendacoes TEXT NOT NULL,
    idProdutor INT UNSIGNED NOT NULL,
    idAgronomo INT UNSIGNED NOT NULL,

    PRIMARY KEY (idVisita),

    CONSTRAINT fk_visita_produtor
        FOREIGN KEY (idProdutor)
        REFERENCES Produtor(idProdutor),

    CONSTRAINT fk_visita_agronomo
        FOREIGN KEY (idAgronomo)
        REFERENCES Agronomo(idAgronomo)
) ENGINE=InnoDB;

-- =============================================
-- FIM DO SCRIPT DDL
-- =============================================
