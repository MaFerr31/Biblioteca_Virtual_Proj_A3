Feature: Gerenciar Planos de Assinaturas na Biblioteca Virtual
  Permitir que os usuários escolham e gerenciem seus planos de assinatura.

  Scenario Outline: Adquirir um plano de assinatura
    Given Que sou um usuário cadastrado
    When Escolho o plano "<plano>"
    And Confirmo o pagamento com o método "<metodo_pagamento>"
    Then Exibe a mensagem "<mensagem>"
    And Ativa o plano para o usuário

  Examples:
    | plano         | metodo_pagamento | mensagem                                 |
    | Básico        | Cartão de Crédito | Plano Básico ativado com sucesso.       |
    | Premium       | Boleto            | Plano Premium ativado com sucesso.      |

  Scenario Outline: Tentar adquirir um plano sem pagamento válido
    Given Que sou um usuário cadastrado
    When Escolho o plano "<plano>"
    And Tento confirmar o pagamento com "<metodo_pagamento>"
    Then Exibe a mensagem "<mensagem>"
    And Não ativa o plano para o usuário

  Examples:
    | plano         | metodo_pagamento   | mensagem                                |
    | Básico        | Cartão recusado    | Pagamento não aprovado. Tente novamente. |
    | Premium       | Dados incompletos  | Falha no pagamento. Verifique os dados. |

  Scenario Outline: Atualizar plano de assinatura
    Given Que sou um usuário com o plano "<plano_atual>"
    When Escolho atualizar para o plano "<plano_novo>"
    And Confirmo o pagamento com "<metodo_pagamento>"
    Then Exibe a mensagem "<mensagem>"
    And Atualiza o plano do usuário no sistema

  Examples:
    | plano_atual   | plano_novo  | metodo_pagamento | mensagem                              |
    | Básico        | Premium     | Cartão de Crédito | Plano atualizado para Premium com sucesso. |
    | Básico        | Avançado    | Pix               | Plano atualizado para Avançado com sucesso. |

  Scenario Outline: Cancelar plano de assinatura
    Given Que sou um usuário com o plano "<plano>"
    When Solicito o cancelamento do plano
    Then Exibe a mensagem "<mensagem>"
    And Cancela o plano no sistema

  Examples:
    | plano         | mensagem                            |
    | Básico        | Plano Básico cancelado com sucesso. |
    | Premium       | Plano Premium cancelado com sucesso.|

  Scenario Outline: Exibir informações sobre os planos
    Given Que sou um usuário acessando a página de planos
    When Visualizo as informações dos planos disponíveis
    Then Exibe as opções "<plano>" com os detalhes "<detalhes>"

  Examples:
    | plano         | detalhes                                           |
    | Básico        | Acesso a 5 itens por mês, custo de R$19,90.        |
    | Premium       | Acesso ilimitado, custo de R$49,90 por mês.        |
    | Avançado      | Acesso a 10 itens por mês, custo de R$29,90.       |