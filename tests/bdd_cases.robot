*** Settings ***
Resource    ../resources/keywords/bdd_keywords.robot

#Suite Setup     Abrir pagina inicial
Suite Teardown  Close All Browsers

*** Test Cases ***
Teste do login com um usuário inválido
    [Documentation]  Teste de aceitação com o BDD com usuário/Senha inválida
    [Setup]    Abrir pagina inicial
    Given que o usuario está na página ${URL_HOME}
    When o usuário logar com o username "whatever" and the "whatever"
    Then o usuário deverá ver a mensagem "${error-button}"
    [Teardown]  Close Browser

Teste do login com um usuário válido
    [Documentation]   Teste de aceitação com o BDD de Login com usuário válido.
    [Setup]    Abrir pagina inicial
    Given que o usuario está na página ${URL_HOME}
    When o usuário logar com o username "${accepted_usernames}" and the "${accepted_password}"
    Then que o usuario está na página ${URL_INVENTORY}
    [Teardown]    Close Browser

Teste de Visualização de Produtos
    [Documentation]   Teste de aceitação com o BDD de visualização da lista de produtos após o login.
    [Setup]    Abrir pagina inicial
    Given que o usuario está na página ${URL_HOME}
    When o usuário logar com o username "${accepted_usernames}" and the "${accepted_password}"
    Then a lista de produtos deve ser exibida

Teste de adição de produtos ao carrinho
    [Documentation]   Teste de aceitação com o BDD de adição de um ou mais produtos ao carrinho.
    Given que o usuario está na página ${URL_INVENTORY}
    When o usuário clica nos itens   0  4  5
    Then o carrinho deve conter os itens  0  4  5

Teste de remoção de produtos do carrinho
    [Documentation]   Teste de aceitação com o BDD da remoção de produtos do carrinho.
    Given que o usuario está na página ${URL_INVENTORY}
    When o usuário clica no carrinho
    And o usuário clica para remover os itens   0  4
    Then o carrinho deve conter os itens  5


Teste finalização de compra
    [Documentation]   Teste de aceitação com o BDD do fluxo de finalização de compra.
    Given que o usuario está na página ${URL_CART}
    And o usuário clica no botão ${button_checkout}
    When o usuário preenche Loren, Ipsun e 321456
    And o usuário clica no botão ${continue_button}
    And o usuário confere a compra
    Then o usuário finaliza a compra
    [Teardown]  Close Browser


