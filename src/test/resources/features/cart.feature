Feature: Gerenciamento de carrinho

    Scenario: CT001_Validar obtencao de todos os carrinhos
        Given obtenho todos os produtos no carrinho
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario Outline: CT002_Validar obtencao de carrinho por identificador
        Given obtenho carrinho com identificador <id>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | id |
            | 1  |
            | 2  |
            | 3  |
            | 4  |

    Scenario Outline: CT003_Validar obtencao de carrinhos com limite de resultados
        Given obtenho carrinhos com limite de <limit> resultados
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | limit |
            | 1     |
            | 2     |
            | 3     |
            | 4     |

    Scenario Outline: CT004_Validar obtencao de carrinhos ordenados
        Given obtenho carrinhos ordenados de forma <ordem>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | ordem |
            | "asc" |
            | "desc" |

    Scenario Outline: CT005_Validar obtencao de carrinhos em intervalo de datas
        Given obtenho carrinhos no intervalo de datas <start_date> e <end_date>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
        | start_date | end_date |
        | "2021-01-01" | "2021-12-31" |
        | "2021-01-01" | "2021-06-30" |

    Scenario Outline: CT006_Validar obtencao de carrinhos de usuário
        Given obtenho carrinhos do usuario com identificador <id>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | id  |
            | "1" |
            | "2" |

    Scenario Outline: CT007_Validar adição de produto com sucesso no carrinho
        Given adiciono produto para o <userId> com <date>, <productId>, <quantity>
        When realizo requisicao
        Then informa sucesso na criacao

        Examples:
            | userId | date         | productId | quantity |
            | 1      | "2021-01-01" | 5         | 2        |
            | 5      | "2021-02-01" | 1         | 3        |

    Scenario Outline: CT008_Validar edição de produto com sucesso no carrinho
        Given edito produto para o <userId> com <date>, <productId>, <quantity>
        When realizo requisicao
        Then informa sucesso na edicao

        Examples:
            | userId | date         | productId | quantity |
            | 1      | "2021-01-01" | 5         | 2        |
            | 5      | "2021-02-01" | 1         | 3        |

    Scenario Outline: CT009_Validar remoção de carrinho com sucesso
        Given deleto carrinho com identificador <id>
        When realizo requisicao
        Then informa sucesso na exclusao

        Examples:
            | id |
            | 1  |
            | 2  |
            | 3  |
            | 4  |
