ENTIDADES E ATRIBUTOS – COOPERATIVA DE CANA-DE-AÇÚCAR
Versão atualizada
 Baseada na estrutura SQL recuperada
1. PRODUTOR
Armazena os dados cadastrais dos produtores associados à cooperativa.
- idProdutor (PK)
- codigoProdutor (UK)
- nome
- cpf (UK)
- telefone
- logradouro
- numero
- bairro
- cidade
- uf
- cep
2. USINA
Armazena os dados das usinas que recebem a produção de cana-de-açúcar.
- idUsina (PK)
- nomeUsina
- cnpj (UK)
- cidade
- telefone
3. ENTREGA_CANA
Registra as entregas de cana realizadas pelos produtores às usinas.
- idEntrega (PK)
- dataEntrega
- toneladas
- valorPago
- idProdutor (FK)
- idUsina (FK)
4. CONTRIBUICAO_ANUAL
Registra os valores das contribuições anuais dos produtores e os respectivos repasses.
- idContribuicao (PK)
- anoReferencia
- valorBase
- percentual
- valorContribuicao
- autorizado
- dataPagamento
- statusPagamento
- idProdutor (FK)
- idUsinaRepasse (FK)
Observação: existe uma restrição UNIQUE combinando idProdutor e anoReferencia, impedindo duas contribuições para o mesmo produtor no mesmo ano.
5. INSUMO
Armazena os produtos agrícolas disponibilizados pela cooperativa.
- idInsumo (PK)
- nomeInsumo
- categoria
- descricao
- unidadeMedida
- precoUnitario
6. COMPRA
Registra as compras realizadas pelos produtores associados.
- idCompra (PK)
- dataCompra
- statusCompra
- idProdutor (FK)
Observação: o valor total da compra é obtido pela soma dos valores dos itens. Não existe um atributo valorTotal na tabela atual.
7. ITEM_COMPRA
Armazena os insumos, as quantidades e os preços praticados em cada compra.
- idCompra (PK composta e FK)
- idInsumo (PK composta e FK)
- quantidade
- precoPraticado
Observação: a chave primária é composta por idCompra e idInsumo. O subtotal é calculado pela multiplicação da quantidade pelo preço praticado.
8. AGRONOMO
Armazena os dados dos profissionais responsáveis pela assistência técnica.
- idAgronomo (PK)
- nome
- registroProfissional (UK)
- telefone
9. VISITA_TECNICA
Registra as visitas realizadas pelos agrônomos aos produtores.
- idVisita (PK)
- dataVisita
- observacoes
- recomendacoes
- idProdutor (FK)
- idAgronomo (FK)

2. Relacionamentos e cardinalidades
Relacionamento	Cardinalidade

PRODUTOR — ENTREGA_CANA	1:N

USINA — ENTREGA_CANA	1:N

PRODUTOR — CONTRIBUICAO_ANUAL	1:N

USINA — CONTRIBUICAO_ANUAL	1:N*

PRODUTOR — COMPRA	1:N

COMPRA — ITEM_COMPRA	1:N

INSUMO — ITEM_COMPRA	1:N

PRODUTOR — VISITA_TECNICA	1:N

AGRONOMO — VISITA_TECNICA	1:N

O relacionamento entre USINA e CONTRIBUICAO_ANUAL ocorre pelo campo idUsinaRepasse, que pode ser nulo quando ainda não há usina registrada como responsável pelo repasse.

3. O que mudou em relação à sua lista antiga?
Esta é a parte mais importante para você não se perder novamente.
Tabela	Mudança realizada
PRODUTOR	Endereço dividido em logradouro, número, bairro, cidade, UF e CEP. Acrescentado codigoProdutor.
USINA	Nome alterado para nomeUsina e endereço simplificado para cidade.
ENTREGA_CANA	valorRecebido passou a ser valorPago.
CONTRIBUICAO_ANUAL	Acrescentados valorBase e idUsinaRepasse. Autorização e pagamento tiveram os nomes ajustados.
INSUMO	Acrescentados categoria e nomeInsumo.
COMPRA	Acrescentado statusCompra e retirado valorTotal.
ITEM_COMPRA	Retirado idItem; adotada chave primária composta. precoUnitario passou a precoPraticado.
AGRONOMO	Retirado email; registroProfissional passou a ser único.
VISITA_TECNICA	Mantida a estrutura, com nomes padronizados.

4. Legenda do DER
- PK: chave primária – identifica cada registro.
- FK: chave estrangeira – estabelece relacionamento entre tabelas.
- UK: campo com valor único.
- 1:N: um para muitos.
- PK composta: chave formada por dois ou mais atributos.
5. Resumo da estrutura final
9
Tabelas

9
Relacionamentos



Tabelas do projeto
- PRODUTOR
- USINA
- ENTREGA_CANA
- CONTRIBUICAO_ANUAL
- INSUMO
- COMPRA
- ITEM_COMPRA
- AGRONOMO
- VISITA_TECNICA
