# Cana de Açucar
# Modelo de Entidade e Relacionamento (MER) - Usina de Cana-de-Açúcar

## 1. Entidades

* **Fazenda:** Representa a propriedade rural onde a cana-de-açúcar é cultivada.
* **Talhao:** Representa a subdivisão física do terreno da fazenda utilizada no controle do plantio e colheita.
* **VariedadeCana:** Representa o tipo/genética da cana-de-açúcar plantada (ex: RB867515, CTC4).
* **Motorista:** Representa o condutor responsável pelo transporte da matéria-prima até a usina.
* **Caminhao:** Representa o veículo utilizado no transporte do lote colhido.
* **Carregamento:** Representa o registro individual de viagem com dados de pesagem e recepção da cana.

---

## 2. Relacionamentos e Cardinalidades

* **[Fazenda] (1,1) <possui> (1,N) [Talhao]**
  * *Explicação:* Uma Fazenda possui obrigatoriamente 1 ou vários Talhões, mas cada Talhão pertence a apenas 1 Fazenda.

* **[Talhao] (0,N) <cultiva> (1,1) [VariedadeCana]**
  * *Explicação:* Um Talhão cultiva obrigatoriamente 1 Variedade de Cana, enquanto uma Variedade de Cana pode estar plantada em vários Talhões.

* **[Talhao] (1,1) <origina> (0,N) [Carregamento]**
  * *Explicação:* Um Talhão pode originar múltiplos Carregamentos ao longo de uma colheita, mas cada Carregamento sai de apenas 1 Talhão de origem.

* **[Motorista] (1,1) <conduz> (0,N) [Carregamento]**
  * *Explicação:* Um Motorista pode realizar 0 ou vários Carregamentos ao longo da safra, mas cada Carregamento é conduzido por apenas 1 Motorista.

* **[Caminhao] (1,1) <transporta> (0,N) [Carregamento]**
  * *Explicação:* Um Caminhão pode realizar vários Carregamentos, mas um registro de Carregamento específico é transportado por apenas 1 Caminhão.

---

## 3. Sugestão de Atributos

### Fazenda
* `id_fazenda` (PK)
* `nome_fazenda`
* `municipio`
* `inscricao_estadual`

### Talhao
* `id_talhao` (PK)
* `numero_talhao`
* `area_hectares`
* `data_plantio`

### VariedadeCana
* `id_variedade` (PK)
* `nome_tecnico`
* `ciclo_maturacao`

### Motorista
* `id_motorista` (PK)
* `nome`
* `cpf`
* `cnh`

### Caminhao
* `id_caminhao` (PK)
* `placa`
* `modelo`
* `capacidade_toneladas`

### Carregamento
* `id_carregamento` (PK)
* `data_hora_entrada`
* `peso_bruto`
* `peso_tara`
* `peso_liquido` (Derivado: peso_bruto - peso_tara)

---

## 4. Diagrama Entidade e Relacionamento (DER)

```mermaid
erDiagram
    FAZENDA ||--|{ TALHAO : possui
    VARIEDADE_CANA ||--o{ TALHAO : cultiva
    TALHAO ||--o{ CARREGAMENTO : origina
    MOTORISTA ||--o{ CARREGAMENTO : conduz
    CAMINHAO ||--o{ CARREGAMENTO : transporta

    FAZENDA {
        int id_fazenda PK
        string nome_fazenda
        string municipio
    }

    TALHAO {
        int id_talhao PK
        int numero_talhao
        float area_hectares
        date data_plantio
    }

    VARIEDADE_CANA {
        int id_variedade PK
        string nome_tecnico
        string ciclo_maturacao
    }

    MOTORISTA {
        int id_motorista PK
        string nome
        string cpf
        string cnh
    }

    CAMINHAO {
        int id_caminhao PK
        string placa
        string modelo
    }

    CARREGAMENTO {
        int id_carregamento PK
        datetime data_hora_entrada
        float peso_bruto
        float peso_tara
        float peso_liquido
    }
