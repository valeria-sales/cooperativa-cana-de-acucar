# Modelo Entidade Relacionamento (MER)

## 1. Entidades

### Produtor

Representa o associado da cooperativa.

### Insumo

Representa os produtos comercializados pela cooperativa.

### Compra

Representa uma compra realizada por um produtor.

### Mensalidade

Representa o pagamento anual da associação.

---

## 2. Relacionamentos e Cardinalidades

### Produtor e Compra

[Produtor] (1,N) realiza (1,1) [Compra]

Explicação:
Um produtor pode realizar várias compras, mas cada compra pertence a apenas um produtor.

### Compra e Insumo

[Compra] (N,N) contém (N,N) [Insumo]

Explicação:
Uma compra pode conter vários insumos e um insumo pode fazer parte de várias compras.

### Produtor e Mensalidade

[Produtor] (1,N) paga (1,1) [Mensalidade]

Explicação:
Um produtor pode pagar várias mensalidades ao longo dos anos.

---

## 3. Sugestão de Atributos

### Produtor

* PK id_produtor
* nome
* cpf
* telefone
* endereco
* data_associacao

### Insumo

* PK id_insumo
* nome
* tipo
* preco
* estoque

### Compra

* PK id_compra
* data_compra
* valor_total

### Mensalidade

* PK id_mensalidade
* ano_referencia
* valor
* data_pagamento
* status


