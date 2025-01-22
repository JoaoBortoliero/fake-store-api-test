Feature: Gerenciamento de produtos

    Scenario: CT001_Validar obtencao de todos os produtos
        Given obtenho todos os produtos
        When realizo requisicao
        Then informa sucesso na operacao "get all"

    Scenario Outline: CT002_Validar obtencao de produto por id
        Given obtenho produto com identificador <id>
        When realizo requisicao
        Then informa sucesso na operacao "get single"

        Examples:
            | id |
            | 1  |
            | 8  |

    Scenario Outline: CT003_Validar obtencao de produtos com limite de resultados
        Given obtenho produtos com limite de <limit>
        When realizo requisicao
        Then informa sucesso na operacao "limit results"

        Examples:
            | limit |
            | 3     |
            | 5     |

    Scenario Outline: CT004_Validar obtencao de produtos ordenados
        Given obtenho produtos ordenados de forma <ordem>
        When realizo requisicao
        Then informa sucesso na operacao "sort results"

        Examples:
            | ordem  |
            | "asc" |
            | "desc" |

    Scenario: CT005_Validar obtencao de todas as categorias
        Given obtenho todas as categorias
        When realizo requisicao
        Then informa sucesso na operacao "all categories"

    Scenario Outline: CT006_Validar obtencao de produtos por categoria
        Given obtenho produtos da categoria <category>
        When realizo requisicao
        Then informa sucesso na operacao "specific category"

        Examples:
            | category           |
            | "electronics"      |
            | "jewelery"         |
            | "women's clothing" |
            | "men's clothing"   |

    Scenario Outline: CT007_Validar criacao de produto com sucesso
        Given crio produto <title>, <price>, <description>, <image> e <category>
        When realizo requisicao
        Then informa sucesso na operacao "create"

        Examples:
            | title                | price | description                                        | image                                                              | category         |
            | "Mens Cotton Jacket" | 55.99 | "great outerwear jackets for Spring/Autumn/Winter" | "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg" | "men's clothing" |
            | "Smartphone"         | 1000  | "Iphone 12"                                        | "https://images.unsplash.com/photo-1587396415746-3b9b8bbf8b7d"     | "electronics"    |


    Scenario Outline: CT008_Validar atualizacao de produto com sucesso
        Given atualizo produto <id>, <title>, <price>, <description>, <image> e <category>
        When realizo requisicao
        Then informa sucesso na operacao "update"

        Examples:
            | id | title        | price | description      | image                               | category      |
            | 1 | "Smartphone" | 1000  | "New smartphone" | "https://images.unsplash.com/photo" | "electronics" |

    Scenario Outline: CT009_Validar exclusao de produto com sucesso
        Given deleto produto com identificador <id>
        When realizo requisicao
        Then informa sucesso na operacao "delete"

        Examples:
            | id |
            | 1  |
            | 2  |
            | 3  |
            | 4  |