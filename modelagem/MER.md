Entidades e Atributos
PRODUTOR
id_produtor (PK)
nome
cpf
telefone
endereco
data_associacao
USINA
id_usina (PK)
nome
cnpj
endereco
telefone
ENTREGA_CANA
id_entrega (PK)
data_entrega
toneladas
valor_recebido
id_produtor (FK)
id_usina (FK)
CONTRIBUICAO_ANUAL
id_contribuicao (PK)
ano_referencia
percentual_cobranca
valor_descontado
data_repasse
autorizacao_desconto
status_pagamento
id_produtor (FK)
AGRONOMO
id_agronomo (PK)
nome
cpf
telefone
email
registro_crea
VISITA_TECNICA
id_visita (PK)
data_visita
observacoes
recomendacoes
id_produtor (FK)
id_agronomo (FK)
INSUMO
id_insumo (PK)
nome
descricao
unidade_medida
preco_unitario
COMPRA
id_compra (PK)
data_compra
valor_total
id_produtor (FK)
ITEM_COMPRA
id_item (PK)
quantidade
valor_unitario
subtotal
id_compra (FK)
id_insumo (FK)
Relacionamentos
PRODUTOR (1) ENTREGA_CANA
USINA (1) ENTREGA_CANA
PRODUTOR (1) CONTRIBUICAO_ANUAL
PRODUTOR (1) COMPRA
COMPRA (1) ITEM_COMPRA
INSUMO (1) ITEM_COMPRA
PRODUTOR (1) VISITA_TECNICA
AGRONOMO (1) VISITA_TECNICA
Entidades Finais do Projeto
PRODUTOR
USINA
ENTREGA_CANA
CONTRIBUICAO_ANUAL
AGRONOMO
VISITA_TECNICA
INSUMO
COMPRA
ITEM_COMPRA
