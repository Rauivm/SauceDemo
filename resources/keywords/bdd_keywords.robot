*** Settings ***
Library      SeleniumLibrary
Resource     ../keywords/login.robot
Resource     ../keywords/common.robot
Resource     ../keywords/inventory.robot
Resource     ../keywords/cart.robot

Resource     ../variables/variables.robot
Resource     ../variables/inventory_variables.robot
Resource     ../variables/cart_variables.robot
Resource    checkout.robot

*** Keywords ***
que o usuario está na página ${URL}
    Location Should Be    ${URL}
o usuário logar com o username "${usuario}" and the "${senha}"
    Input Text        ${username}    ${usuario}
    Input Password    ${password}    ${senha}
    Click Button      ${login-button}

o usuário será redirecionado para a página "${URL}"
    Location Should Be    ${URL}

o usuário deverá ver a mensagem "${message}"
    Element Should Be Visible    ${error-button}

a lista de produtos deve ser exibida
    Verificar Item na Lista

o usuário clica nos itens
    [Arguments]    @{items}
    Add Items To Cart    @{items}

o carrinho deve conter os itens
    [Arguments]   @{items}
    Verify Items In Cart   @{items}

 o usuário clica no carrinho
    Go To Cart
o usuário clica para remover os itens
    [Arguments]   @{items}
    Remove Items From Cart    @{items}

o usuário clica no botão ${button}
    Click Element    ${button}

o usuário preenche ${name}, ${lastname} e ${zipcode}
#    ${name} ${lastname} ${zipcode}=  Generate Fake Data
    Checkout: Your Information   ${name}  ${lastname}  ${zipcode}

o usuário confere a compra
    Assert Values

o usuário finaliza a compra
    Go to Finish