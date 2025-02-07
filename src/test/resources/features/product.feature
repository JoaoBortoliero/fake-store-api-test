Feature: Gerenciamento de produtos

    Scenario Outline: CT001_Validar sucesso na obtencao de todos os produtos
        Given obtenho todos os produtos
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | operation |
            | "get all" |

    Scenario Outline: CT002_Validar obtencao de produto por id
        Given obtenho produto com identificador <id>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | id | operation    |
            | 1  | "get single" |
            | 8  | "get single" |

    Scenario Outline: CT003_Validar obtencao de produtos com limite de resultados
        Given obtenho produtos com limite de <limit>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | limit | operation |
            | 3     | "limit results" |
            | 5     | "limit results" |

    Scenario Outline: CT004_Validar obtencao de produtos ordenados
        Given obtenho produtos ordenados de forma <ordem>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | ordem  | operation |
            | "asc"  | "sort results" |
            | "desc" | "sort results" |

    Scenario Outline: CT005_Validar obtencao de todas as categorias
        Given obtenho todas as categorias
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | operation |
            | "all categories" |

    Scenario Outline: CT006_Validar obtencao de produtos por categoria
        Given obtenho produtos da categoria <category>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | category           | operation          |
            | "electronics"      | "specific category" |
            | "jewelery"         | "specific category" |
            | "women's clothing" | "specific category" |
            | "men's clothing"   | "specific category" |

    Scenario Outline: CT007_Validar criacao de produto com sucesso
        Given crio produto <title>, <price>, <description>, <image> e <category>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | title                | price | description                                        | image                                                              | category         | operation |
            | "Mens Cotton Jacket" | 55.99 | "great outerwear jackets for Spring/Autumn/Winter" | "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg" | "men's clothing" | "create"  |
            | "Smartphone"         | 1000  | "Iphone 12"                                        | "https://images.unsplash.com/photo-1587396415746-3b9b8bbf8b7d"     | "electronics"    | "create"  |


    Scenario Outline: CT008_Validar atualizacao de produto com sucesso
        Given atualizo produto <id>, <title>, <price>, <description>, <image> e <category>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | id | title        | price | description      | image                               | category      | operation |
            | 1  | "Smartphone" | 1000  | "New smartphone" | "https://images.unsplash.com/photo" | "electronics" | "update"  |

    Scenario Outline: CT009_Validar exclusao de produto com sucesso
        Given deleto produto com identificador <id>
        When realizo requisicao de produto <operation>
        Then informa sucesso na operacao de produto <operation>

        Examples:
            | id | operation |
            | 1  | "delete"  |
            | 2  | "delete"  |
            | 3  | "delete"  |
            | 4  | "delete"  |