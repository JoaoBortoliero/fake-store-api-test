Feature: Gerenciamento de usuarios

    Scenario: CT001_Validar obtencao de todos os usuarios
        Given obtenho todos os usuarios
        When realizo requisicao
        Then informa sucesso na obtencao

    Scenario Outline: CT002_Validar obtencao de usuario por id
        Given obtenho usuario com identificador <id>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | id |
            | 1  |
            | 2  |
            | 3  |
            | 4  |

    Scenario Outline: CT003_Validar obtencao de usuarios com limite de resultados
        Given obtenho usuarios com limite de <limit>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | limit |
            | 1     |
            | 2     |
            | 3     |
            | 4     |

    Scenario Outline: CT004_Validar obtencao de usuarios ordenados
        Given obtenho usuarios ordenados de forma <ordem>
        When realizo requisicao
        Then informa sucesso na obtencao

        Examples:
            | ordem |
            | "asc" |
            | "desc" |

    Scenario Outline: CT005_Validar adicao de usuario com sucesso
        Given adiciono usuario com <email>, <username>, <password>, <firstname>, <lastname>, <city>, <street>, <number>, <zipcode>, <lat>, <long>, <phone>
        When realizo requisicao
        Then informa sucesso na adicao

        Examples:
            | email          | username | password | firstname | lastname | city     | street        | number | zipcode    | lat      | long    | phone |
            | John@gmail.com | John     | m38rmF$  | John      | Doe      | kilcoole | 7835 new road | 123    | 12926-3874 | -37.3159 | 81.1496 | 1-570-236-7033 |

    Scenario Outline: CT006_Validar atualizacao de usuario com sucesso
        Given atualizo usuario com <email>, <username>, <password>, <firstname>, <lastname>, <city>, <street>, <number>, <zipcode>, <lat>, <long>, <phone>
        When realizo requisicao
        Then informa sucesso na atualizao

        Examples:
            | email          | username | password | firstname | lastname | city     | street     | number | zipcode    | lat      | long    | phone |
            | John@gmail.com | John     | m38rmF$  | John      | Doe      | new york | 5th avenue | 123    | 12926-3874 | -37.3159 | 81.1496 | 1-570-236-7033 |

    Scenario Outline: CT007_Validar delecao de usuario com sucesso
        Given deleto usuario com identificador <id>
        When realizo requisicao
        Then informa sucesso na delecao

        Examples:
            | id |
            | 1  |
            | 2  |