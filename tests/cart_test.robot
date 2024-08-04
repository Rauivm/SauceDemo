*** Settings ***
Library      SeleniumLibrary
Resource     ../resources/keywords/login.robot
Resource     ../resources/keywords/common.robot
Resource     ../resources/keywords/inventory.robot
Resource     ../resources/keywords/cart.robot

Resource     ../resources/variables/variables.robot
Resource     ../resources/variables/inventory_variables.robot
Resource     ../resources/variables/cart_variables.robot

*** Test Cases ***
Adicionar itens ao carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart       0    4    5
    Go To Cart
    Verify Items In Cart    0    4    5
    [Teardown]    Close All Browsers

Remover itens do carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart    0    4    5
    Go To Cart
    Remove Items From Cart   0   4
    Verify Items In Cart     5
    [Teardown]    Close All Browsers

Remover todos os itens do carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart    0    4    5
    Go To Cart
    Remove All Items From Cart
    Cart Is EMPTY
    [Teardown]    Close All Browsers
