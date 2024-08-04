*** Settings ***
Library      SeleniumLibrary
Library      FakerLibrary    locale=pt_BR
Resource     ../resources/keywords/login.robot
Resource     ../resources/keywords/common.robot
Resource     ../resources/keywords/inventory.robot
Resource     ../resources/keywords/cart.robot
Resource     ../resources/keywords/checkout.robot

Resource     ../resources/variables/variables.robot
Resource     ../resources/variables/inventory_variables.robot
Resource     ../resources/variables/cart_variables.robot


*** Test Cases ***
Adicionar itens ao carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart    1    4    0
    Go To Cart
    Verify Items In Cart    1    4    0
    Go to the checkout
    Click in Continue Button
    ${name}    ${lastname}    ${postcode}=    Generate Fake Data
    Checkout: Your Information    ${name}    ${lastname}    ${postcode}
    Click in Continue Button
    Assert Values
    Go to Finish
    [Teardown]    Close All Browsers


Remover itens do carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart    1    4    0
    Go To Cart
    Remove Items From Cart    1    4
    Verify Items In Cart      0
    Go to the checkout
    Click in Continue Button
    ${name}    ${lastname}    ${postcode}=    Generate Fake Data
    Checkout: Your Information    ${name}    ${lastname}    ${postcode}
    Click in Continue Button
    Assert Values
    Go to Finish
    [Teardown]    Close All Browsers


Remover todos os itens do carrinho
    [Setup]    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Add Items To Cart    1    4    0
    Go To Cart
    Remove All Items From Cart
    Verify Items In Cart      0
    Go to the checkout
    Click in Continue Button
    ${name}    ${lastname}    ${postcode}=    Generate Fake Data
    Checkout: Your Information    ${name}    ${lastname}    ${postcode}
    Click in Continue Button
    Assert Values
    Go to Finish
    [Teardown]    Close All Browsers