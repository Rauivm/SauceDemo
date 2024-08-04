*** Settings ***
Library      SeleniumLibrary
Resource     ../resources/keywords/login.robot
Resource     ../resources/keywords/common.robot
Resource     ../resources/keywords/inventory.robot

Resource     ../resources/variables/variables.robot
Resource     ../resources/variables/inventory_variables.robot

*** Test Cases ***
Adicionar itens ao carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add All Items
    [Teardown]    Close All Browsers

Remover item do carrinho pela página do inventório
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add All Items
    Remove All Items
    [Teardown]    Close All Browsers

Visualização de Produtos
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Verificar Item na Lista
    [Teardown]    Close All Browsers
