Modelo Entidade-Relacionamento (MER)
Sistema de Gestão da Cooperativa de Cana-de-Açúcar
1. Apresentação
O Sistema de Gestão da Cooperativa de Cana-de-Açúcar tem como objetivo organizar e controlar as principais atividades realizadas pela cooperativa e seus produtores associados.

O sistema permite registrar produtores, usinas conveniadas, entregas de cana-de-açúcar, contribuições anuais, insumos agrícolas, compras e visitas técnicas realizadas pelos agrônomos.

O modelo foi desenvolvido para representar as necessidades do negócio, organizando as informações em entidades relacionadas entre si e garantindo a integridade dos dados.

2. Entidades e atributos
O banco de dados é composto por nove entidades.

2.1 PRODUTOR
Armazena os dados cadastrais dos produtores associados à cooperativa.

Atributos:

idProdutor (PK): identificador do produtor.
codigoProdutor (UNIQUE): código de identificação do produtor.
nome: nome completo.
cpf (UNIQUE): CPF do produtor.
telefone: telefone para contato.
logradouro: endereço do produtor.
numero: número do endereço.
bairro: bairro.
cidade: cidade.
uf: estado.
cep: código de endereçamento postal.
2.2 USINA
Armazena os dados das usinas conveniadas que recebem a produção de cana-de-açúcar.

Atributos:

idUsina (PK): identificador da usina.
nomeUsina: nome da usina.
cnpj (UNIQUE): CNPJ da usina.
cidade: cidade onde está localizada.
telefone: telefone para contato.
2.3 ENTREGA_CANA
Registra as entregas de cana-de-açúcar realizadas pelos produtores nas usinas.

Atributos:

idEntrega (PK): identificador da entrega.
dataEntrega: data da entrega.
toneladas: quantidade de cana entregue em toneladas.
valorPago: valor pago pela usina.
idProdutor (FK): identifica o produtor responsável pela entrega.
idUsina (FK): identifica a usina que recebeu a entrega.
2.4 CONTRIBUICAO_ANUAL
Registra as contribuições anuais dos produtores para a cooperativa.

Atributos:

idContribuicao (PK): identificador da contribuição.
anoReferencia: ano de referência da contribuição.
valorBase: valor utilizado como base para o cálculo.
percentual: percentual aplicado.
valorContribuicao: valor calculado da contribuição.
autorizado: indica se o repasse foi autorizado.
dataPagamento: data do pagamento.
statusPagamento: situação do pagamento.
idProdutor (FK): identifica o produtor responsável.
idUsinaRepasse (FK): identifica a usina responsável pelo repasse, quando houver.
Observação: cada produtor pode possuir uma contribuição por ano de referência. O relacionamento com a usina é opcional.

2.5 INSUMO
Armazena os produtos agrícolas disponibilizados pela cooperativa aos produtores.

Atributos:

idInsumo (PK): identificador do insumo.
nomeInsumo: nome do insumo.
categoria: categoria do produto.
descricao: descrição do insumo.
unidadeMedida: unidade utilizada para comercialização.
precoUnitario: preço por unidade.
2.6 COMPRA
Registra as compras de insumos realizadas pelos produtores associados.

Atributos:

idCompra (PK): identificador da compra.
dataCompra: data da compra.
statusCompra: situação da compra.
idProdutor (FK): identifica o produtor que realizou a compra.
2.7 ITEM_COMPRA
Registra os insumos e as respectivas quantidades e preços de cada compra.

Atributos:

idCompra (PK, FK): identifica a compra.
idInsumo (PK, FK): identifica o insumo.
quantidade: quantidade adquirida.
precoPraticado: preço unitário praticado na compra.
Observação: a chave primária é composta por idCompra e idInsumo. O subtotal de cada item pode ser calculado pela multiplicação da quantidade pelo preço praticado. O valor total da compra pode ser obtido pela soma dos subtotais.

2.8 AGRONOMO
Armazena os dados dos profissionais responsáveis pela assistência técnica aos produtores.

Atributos:

idAgronomo (PK): identificador do agrônomo.
nome: nome completo.
registroProfissional (UNIQUE): número de registro profissional.
telefone: telefone para contato.
2.9 VISITA_TECNICA
Registra as visitas técnicas realizadas pelos agrônomos nas propriedades dos produtores.

Atributos:

idVisita (PK): identificador da visita.
dataVisita: data da visita.
observacoes: informações observadas durante a visita.
recomendacoes: orientações fornecidas ao produtor.
idProdutor (FK): identifica o produtor que recebeu a visita.
idAgronomo (FK): identifica o agrônomo responsável.
3. Relacionamentos e cardinalidades
Os relacionamentos representam as associações existentes entre as entidades do sistema.

3.1 PRODUTOR – ENTREGA_CANA
Um produtor pode realizar nenhuma ou várias entregas de cana-de-açúcar. Cada entrega pertence obrigatoriamente a um único produtor.

Cardinalidade: 1:N.

3.2 USINA – ENTREGA_CANA
Uma usina pode receber nenhuma ou várias entregas. Cada entrega é recebida obrigatoriamente por uma única usina.

Cardinalidade: 1:N.

3.3 PRODUTOR – CONTRIBUICAO_ANUAL
Um produtor pode possuir nenhum ou vários registros de contribuição anual. Cada contribuição pertence a um único produtor.

Cardinalidade: 1:N.

3.4 USINA – CONTRIBUICAO_ANUAL
Uma usina pode estar relacionada a nenhuma ou várias contribuições. Cada contribuição pode estar relacionada a nenhuma ou uma única usina responsável pelo repasse.

Cardinalidade: 1:N, com participação opcional da contribuição no relacionamento.

3.5 PRODUTOR – COMPRA
Um produtor pode realizar nenhuma ou várias compras de insumos. Cada compra pertence a um único produtor.

Cardinalidade: 1:N.

3.6 COMPRA – ITEM_COMPRA
Uma compra deve possuir pelo menos um item e pode conter vários itens. Cada item pertence a uma única compra.

Cardinalidade: 1:N.

3.7 INSUMO – ITEM_COMPRA
Um insumo pode não participar de nenhuma compra ou aparecer em vários itens de compra. Cada item de compra corresponde a um único insumo.

Cardinalidade: 1:N.

3.8 PRODUTOR – VISITA_TECNICA
Um produtor pode receber nenhuma ou várias visitas técnicas. Cada visita é realizada na propriedade de um único produtor.

Cardinalidade: 1:N.

3.9 AGRONOMO – VISITA_TECNICA
Um agrônomo pode realizar nenhuma ou várias visitas técnicas. Cada visita possui um único agrônomo responsável.

Cardinalidade: 1:N.

4. Resumo das cardinalidades
Entidade A	Relacionamento	Entidade B	Mín./Máx. A → B	Mín./Máx. B → A
PRODUTOR	Realiza	ENTREGA_CANA	(0,N)	(1,1)
USINA	Recebe	ENTREGA_CANA	(0,N)	(1,1)
PRODUTOR	Possui	CONTRIBUICAO_ANUAL	(0,N)	(1,1)
USINA	Realiza repasse	CONTRIBUICAO_ANUAL	(0,N)	(0,1)
PRODUTOR	Efetua	COMPRA	(0,N)	(1,1)
COMPRA	Contém	ITEM_COMPRA	(1,N)	(1,1)
INSUMO	Compõe	ITEM_COMPRA	(0,N)	(1,1)
PRODUTOR	Recebe	VISITA_TECNICA	(0,N)	(1,1)
AGRONOMO	Realiza	VISITA_TECNICA	(0,N)	(1,1)
5. Regras de integridade
O modelo utiliza as seguintes regras para manter a consistência das informações:

Cada entidade possui uma chave primária para identificar seus registros.
As chaves estrangeiras estabelecem os relacionamentos entre as tabelas.
Os campos de identificação que não podem se repetir utilizam restrições de unicidade.
A tabela ITEM_COMPRA utiliza uma chave primária composta.
O campo idUsinaRepasse da tabela CONTRIBUICAO_ANUAL permite valor nulo.
Cada contribuição anual está associada a um único produtor e a um ano de referência, sem duplicidade para o mesmo produtor e ano.
Os registros de compra são detalhados por meio da tabela ITEM_COMPRA.
6. Diagrama Entidade-Relacionamento (DER)
O DER representa graficamente as entidades, seus atributos, chaves e relacionamentos.

O diagrama atualizado está disponível na raiz do repositório:

DER da Cooperativa de Cana-de-Açúcar

7. Considerações finais
O Modelo Entidade-Relacionamento foi desenvolvido para representar as principais atividades da Cooperativa de Cana-de-Açúcar.

A estrutura contempla o cadastro dos produtores e usinas, o controle das entregas, das contribuições anuais, das compras de insumos e da assistência técnica.

O modelo conceitual e lógico serve de base para a implementação do banco de dados relacional por meio dos scripts SQL DDL e DML.

