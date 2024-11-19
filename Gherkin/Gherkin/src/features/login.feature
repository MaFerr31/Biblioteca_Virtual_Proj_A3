Feature: Login na Biblioteca Virtual
  Fazer Login na aplicação 
  Scenario Outline: Fazer o login incorreto
    Given Que sou estudante cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem |
    | mariagmail.com  |   123456 | Insira @ no e-mail |
    | marianasferra@hotmail.com  | 8888 | Senha com quantidade de caractéres incorreto |

  Scenario Outline: Fazer o login correto
    Given Que sou estudante cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem |
    | mariana@gmail.com  | 123456 | Login validado |
    
  Scenario Outline: Fazer login sem cadastro
    Given Que sou estudante não cadastrado
    When Digito o "<email>"
    And Digito a "<senha>"
    Then Exibe a mensagem  "<mensagem>"
  Examples:
    | email         | senha  | mensagem | 
    | marianaferr@gmail.com  | 123456 | Usuário não encontrado |
    