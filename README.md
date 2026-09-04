#   Sistema de Gestão de Cooperativa de Cana-de-Açúcar

Descrição do Minimundo
Uma cooperativa de cana-de-açúcar reúne diversos produtores rurais que cultivam cana e entregam sua produção para processamento e comercialização. Atualmente, o controle das informações dos cooperados, propriedades, safras, entregas e pagamentos é realizado de forma manual, dificultando a gestão e o acompanhamento da produção.
O sistema proposto tem como objetivo armazenar e gerenciar informações sobre os cooperados, suas propriedades rurais, as safras produzidas, as entregas de cana realizadas e os pagamentos efetuados pela cooperativa.
Regras de Negócio
Um cooperado pode possuir uma ou mais propriedades rurais.
Cada propriedade pertence a apenas um cooperado.
Uma propriedade pode produzir várias safras.
Cada safra pertence a apenas uma propriedade.
Uma safra pode gerar várias entregas de cana.
Cada entrega está vinculada a apenas uma safra.
Cada entrega possui peso e data de entrega.
A cooperativa realiza pagamentos aos cooperados com base nas entregas realizadas.
Um cooperado pode receber vários pagamentos.
Cada pagamento refere-se a apenas um cooperado.
Processos Principais
Cadastro de cooperados.
Cadastro de propriedades rurais.
Controle das safras.
Registro das entregas de cana.
Controle de pagamentos.
Consulta da produção por cooperado.
Consulta dos pagamentos realizados.

modelagem/MER.md
1. Entidades
Cooperado
Definição: Representa o produtor rural associado à cooperativa.
Propriedade
Definição: Representa a fazenda ou terreno utilizado para o cultivo da cana-de-açúcar.
Safra
Definição: Representa um período de produção de cana em determinada propriedade.
Entrega
Definição: Representa a entrega de cana realizada à cooperativa.
Pagamento
Definição: Representa os valores pagos pela cooperativa ao cooperado.

2. Relacionamentos e Cardinalidades
[Cooperado] (1,1) possui (1,N) [Propriedade]
Explicação: Um cooperado pode possuir várias propriedades, mas cada propriedade pertence a apenas um cooperado.
[Propriedade] (1,1) produz (1,N) [Safra]
Explicação: Uma propriedade pode produzir várias safras ao longo dos anos, mas cada safra está associada a apenas uma propriedade.
[Safra] (1,1) gera (1,N) [Entrega]
Explicação: Uma safra pode resultar em várias entregas de cana, mas cada entrega pertence a apenas uma safra.
[Cooperado] (1,1) recebe (1,N) [Pagamento]
Explicação: Um cooperado pode receber diversos pagamentos, mas cada pagamento é destinado a apenas um cooperado.

3. Sugestão de Atributos
Cooperado
PK: id_cooperado
id_cooperado (PK)
nome
cpf
telefone
email
data_associacao

Propriedade
PK: id_propriedade
id_propriedade (PK)
nome_propriedade
area_hectares
endereco
municipio
id_cooperado (FK)

Safra
PK: id_safra
id_safra (PK)
ano_safra
quantidade_produzida
data_inicio
data_fim
id_propriedade (FK)

Entrega
PK: id_entrega
id_entrega (PK)
data_entrega
peso_toneladas
qualidade_cana
id_safra (FK)

Pagamento
PK: id_pagamento
id_pagamento (PK)
data_pagamento
valor
forma_pagamento
id_cooperado (FK)

4. Diagrama Entidade-Relacionamento (DER)
Você pode inserir no MER.md o seguinte código Mermaid:
erDiagram

COOPERADO ||--o{ PROPRIEDADE : possui
PROPRIEDADE ||--o{ SAFRA : produz
SAFRA ||--o{ ENTREGA : gera
COOPERADO ||--o{ PAGAMENTO : recebe

COOPERADO {
int id_cooperado PK
string nome
string cpf
string telefone
string email
date data_associacao
}

PROPRIEDADE {
int id_propriedade PK
string nome_propriedade
float area_hectares
string endereco
string municipio
}

SAFRA {
int id_safra PK
int ano_safra
float quantidade_produzida
date data_inicio
date data_fim
}

ENTREGA {
int id_entrega PK
date data_entrega
float peso_toneladas
string qualidade_cana
}

PAGAMENTO {
int id_pagamento PK
date data_pagamento
decimal valor
string forma_pagamento
}
Esse modelo atende aos requisitos da atividade e possui 5 entidades, relacionamentos, cardinalidades, atributos e DER, sendo adequado para um sistema de gestão de uma cooperativa de cana-de-açúcar.


