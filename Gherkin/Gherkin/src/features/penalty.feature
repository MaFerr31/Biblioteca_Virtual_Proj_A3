Feature: Aplicar Multa na Biblioteca Virtual
  Registrar multa para usuários que atrasaram a devolução de itens.

  Scenario Outline: Aplicar multa por atraso na devolução
    Given Que sou um administrador do sistema
    And O usuário "<nome_usuario>" devolveu o item "<item>" com "<dias_atraso>" dias de atraso
    When Calculo a multa com a taxa diária de "<taxa_diaria>"
    Then Exibe a mensagem "<mensagem>"
    And Registra a multa no sistema

  Examples:
    | nome_usuario    | item                      | dias_atraso | taxa_diaria | mensagem                               |
    | Amanda Sena     | Livro: O Pequeno Príncipe | 5           | 2.00        | Multa de R$10,00 aplicada com sucesso. |
    | João Santos     | Filme: Toy Story 4        | 3           | 3.00        | Multa de R$9,00 aplicada com sucesso.  |

  Scenario Outline: Tentar aplicar multa com atraso zero
    Given Que sou um administrador do sistema
    And O usuário "<nome_usuario>" devolveu o item "<item>" sem atraso
    When Tento calcular a multa
    Then Exibe a mensagem "<mensagem>"
    And Não registra multa no sistema

  Examples:
    | nome_usuario    | item                      | mensagem                               |
    | Maria Oliveira  | Livro: As 48 Leis do Poder | Sem atraso. Multa não aplicável.       |
    | Pedro Costa     | Filme: Missão Resgate      | Sem atraso. Multa não aplicável.       |

  Scenario Outline: Visualizar histórico de multas aplicadas
    Given Que sou um administrador do sistema
    When Acesso a página de multas do usuário "<nome_usuario>"
    Then Exibe o histórico de multas com os itens atrasados e valores correspondentes

  Examples:
    | nome_usuario   |
    | Mariana Silva  |
    | João Santos    |