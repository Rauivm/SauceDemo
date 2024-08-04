*** Settings ***
Library      SeleniumLibrary
Resource     ../resources/keywords/login.robot
Resource     ../resources/keywords/common.robot
Resource     ../resources/variables/variables.robot

*** Test Cases ***
Login Válido
    Abrir pagina inicial
    Efetuar login    ${accepted_usernames}    ${accepted_password}
    Location Should Be    ${URL_INVENTORY}



Login Inválido
    Abrir pagina inicial
    Efetuar login    whatever    ${accepted_password}
    Element Should Be Visible    ${error-button}