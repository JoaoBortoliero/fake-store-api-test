Feature: Gerenciamento de carrinho

    Scenario Outline: CT001_Validar obtencao de todos os carrinhos
        Given obtenho todos os carrinhos
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | operation |
            | "get all" |

    Scenario Outline: CT002_Validar obtencao de carrinho por identificador
        Given obtenho carrinho com identificador <id>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | id | operation    |
            | 1  | "get single" |
            | 7  | "get single" |

    Scenario Outline: CT003_Validar obtencao de carrinhos com limite de resultados
        Given obtenho carrinhos com limite de <limit> resultados
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | limit | operation |
            | 1     | "limit results" |
            | 2     | "limit results" |
            | 3     | "limit results" |

    Scenario Outline: CT004_Validar obtencao de carrinhos ordenados
        Given obtenho carrinhos ordenados de forma <ordem>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | ordem  | operation      |
            | "asc"  | "sort results" |
            | "desc" | "sort results" |

    Scenario Outline: CT005_Validar obtencao de carrinhos em intervalo de datas
        Given obtenho carrinhos no intervalo de datas <start_date> e <end_date>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
        | start_date   | end_date     | operation    |
        | "2021-01-01" | "2021-12-31" | "date range" |
        | "2021-01-01" | "2021-06-30" | "date range" |

    Scenario Outline: CT006_Validar obtencao de carrinhos de usuário
        Given obtenho carrinhos do usuario com identificador <id>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | id  | operation    |
            | "1" | "user carts" |
            | "2" | "user carts" |

    Scenario Outline: CT007_Validar adição de produto com sucesso no carrinho
        Given adiciono produto para o <userId> com <date>, <productId>, <quantity>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | userId | date         | productId | quantity | operation |
            | 1      | "2021-01-01" | 5         | 2        | "create"  |
            | 5      | "2021-02-01" | 1         | 3        | "create"  |

    Scenario Outline: CT008_Validar edição de produto com sucesso no carrinho
        Given edito produto para o <userId> com <date>, <productId>, <quantity>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | userId | date         | productId | quantity | operation |
            | 1      | "2021-01-01" | 5         | 2        | "update"    |
            | 5      | "2021-02-01" | 1         | 3        | "update"    |

    Scenario Outline: CT009_Validar remoção de carrinho com sucesso
        Given deleto carrinho com identificador <id>
        When realizo requisicao de carrinho <operation>
        Then informa sucesso na operacao de carrinho <operation>

        Examples:
            | id | operation |
            | 1  | "delete"  |
            | 2  | "delete"  |
            | 3  | "delete"  |