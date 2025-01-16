Feature: Gerenciamento de produtos

    Scenario: CT001_Validar obtencao de todos os produtos
        Given obtenho todos os produtos
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario: CT002_Validar obtencao de produto por id
        Given obtenho produto com identificador <id>
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario Outline: CT003_Validar obtencao de produtos com limite de resultados
        Given obtenho produtos com limite de <limit>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | limit |
            | 1     |
            | 2     |
            | 3     |
            | 4     |

    Scenario: CT004_Validar obtencao de produtos ordenados
        Given obtenho produtos ordenados
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario: CT005_Validar obtencao de todas as categorias
        Given obtenho todas as categorias
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario Outline: CT006_Validar obtencao de produtos por categoria
        Given obtenho produtos da categoria <category>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | category      |
            | "electronics" |
            | "furniture"   |
            | "jewelery"    |

    Scenario Outline: CT007_Validar criacao de produto com sucesso
        Given crio produto com <name>, <description>, <price>, <image> e <category>
        When realizo requisicao
        Then informa sucesso na criacao

        Examples:
            | name          | description      | price | image                                                          | category      |
            | "Smartphone"  | "New smartphone" | 1000  | "https://images.unsplash.com/photo-1587396415746-3b9b8bbf8b7d" | "electronics" |
            | "Table"       | "New table"      | 500   | "https://images.unsplash.com/photo                             | "furniture"   |

    Scenario Outline: CT008_Validar atualizacao de produto com sucesso
        Given atualizo produto com <id>, <name>, <description>, <price>, <image> e <category>
        When realizo requisicao
        Then informa sucesso na atualizacao

        Examples:
            | id | name          | description      | price | image                              | category      |
            | 1  | "Smartphone"  | "New smartphone" | 1000  | "https://images.unsplash.com/photo | "furniture"   |

    Scenario: CT009_Validar exclusao de produto com sucesso
        Given deleto produto com identificador <id>
        When realizo requisicao
        Then informa sucesso na exclusao