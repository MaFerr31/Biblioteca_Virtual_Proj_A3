Feature: Cadastro na Biblioteca Virtual
  Fazer Login na aplicação 
  Scenario Outline: Fazer o cadastro incorreto
    Given Que sou estudante cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem |
    | mariagmail.com  |   123456 | Insira um e-mail válido |
    | marianasferra@gmail.com  | 2345 | A senha deve conter 8 ou mais caractéres numéricos |

  Scenario Outline: Fazer o cadastro correto
    Given Que sou estudante cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem |
    | kauan@gmail.com  | 123456 | Cadastro realizado com sucesso |
    
  Scenario Outline: Fazer cadastro com usuário já existente
    Given Que sou estudante não cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem | 
    | amandinha@gmail.com  | 123456 | O Usuário já foi criado. |