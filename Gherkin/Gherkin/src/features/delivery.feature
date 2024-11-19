Feature: Selecionar entrega na Biblioteca Virtual
    Selecionar a entrega do item alugado na Biblioteca Virtual
    Scenario Outline: Selecionar entrega sem ter logado.
    Given sou um usuário não logado
    When seleciono a entrega "<entrega>" ao alugar um "<produto>"
    Then exibe a mensagem "<mensagem>"
Examples:
    |entrega| produto | mensagem |
    |à domicílio |  filme  | Faça o Login antes de alugar o produto. |

    Scenario Outline: Selecionar entrega do item já logado.
    Given sou um usuário logado
    When seleciono a entrega "<entrega>" ao alugar um "<produto>"
    Then exibe a mensagem "<mensagem>".
Examples:
    | entrega | produto | mensagem |
    | Retirada no local |  livro  | Item alugado com sucesso. |

    Scenario Outline: Selecionar entrega à domicílio inválido.
    Given sou um usuário logado
    When seleciono a entrega "<entrega>" ao alugar um "<produto>"
    And o endereço for "<endereco>"
    Then exibe a mensagem "<mensagem>"
Examples:
    |  entrega | produto |     endereco    | mensagem |
    | À domicílio |  livro  | inválido      | Endereço inválido. |

    Scenario Outline: Selecionar entrega à domicílio válido.
    Given sou um usuário logado
    When alugar um "<produto>"
    And o pagamento for "<pagamento>"
    Then exibe a mensagem "<mensagem>"
Examples:
    | produto |     pagamento    | mensagem |
    |  disco  | válido   | Item alugado com sucesso. |