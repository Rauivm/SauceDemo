*** Settings ***
Library     SeleniumLibrary
Resource   ../variables/cart_variables.robot

*** Keywords ***
Abrir pagina inicial
    Open Browser    ${URL_HOME}    chrome
    Maximize Browser Window

Go To Cart
    Click Element    ${shopping_cart_link}