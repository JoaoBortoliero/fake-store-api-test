Feature: Realizar login

  Scenario Outline: CT001_Validar login com sucesso
    Given login com <username> e <password>
    When realizo requisicao
    Then informa o token de autenticação

    Examples:
      | username | password |
      | mor_2314 | 83r5^_  |