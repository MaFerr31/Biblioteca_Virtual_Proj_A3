Feature: Alugar na Biblioteca Virtual
    Fazer aluguel do item na Biblioteca Virtual
    Scenario Outline: Alugar item sem ter logado.
    Given sou um usuário sem login
    When alugar um "<produto>"
    Then exibe a mensagem "<mensagem>"
Examples:
    | produto | mensagem |
    |  livro  | Faça o Login antes de alugar o produto. |

    Scenario Outline: Alugar item já logado.
    Given sou um usuário logado
    When alugar um "<produto>".
    Then exibe a mensagem "<mensagem>".
Examples:
    | produto | mensagem |
    |  filme  | Item alugado com sucesso. |

    Scenario Outline: Alugar item com método de pagamento inválido.
    Given sou um usuário logado
    When alugar um "<produto>"
    And o pagamento for "<pagamento>"
    Then exibe a mensagem "<mensagem>"
Examples:
    | produto |     pagamento    | mensagem |
    |  livro  | inválido      | Método de pagamento inválido. |

    Scenario Outline: Alugar item com método de pagamento válido.
    Given sou um usuário logado
    When alugar um "<produto>"
    And o pagamento for "<pagamento>"
    Then exibe a mensagem "<mensagem>"
Examples:
    | produto |     pagamento    | mensagem |
    |  disco  | válido   | Item alugado com sucesso. |
