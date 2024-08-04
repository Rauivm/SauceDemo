*** Settings ***
Resource    common.robot
Resource   ../variables/login_variables.robot
Library    SeleniumLibrary

*** Keywords ***

Efetuar login
    [Arguments]       ${usuario}   ${senha}
    Input Text        ${username}    ${usuario}
    Input Password    ${password}    ${senha}
    Click Button      ${login-button} 