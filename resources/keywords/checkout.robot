*** Settings ***
Library    SeleniumLibrary
Library    String
Library    FakerLibrary  locale=pt_BR
Library           FakerLibrary    WITH NAME    Faker
Resource    ../variables/cart_variables.robot
Resource    ../variables/checktou_variables.robot

*** Keywords ***
Input First Name
    [Arguments]    ${name}
    Input Text     ${first-name}    ${name}
Input Last Name
    [Arguments]   ${lastname}
    Input Text    ${last-name}      ${lastname}

Input Zip/Posta/ Code
    [Arguments]   ${postalcode}
    Input Text    ${postal-code}    ${postalcode}

Checkout: Your Information
    [Arguments]    ${name}    ${lastname}    ${postcode}
    Input First Name    ${name}
    Input Last Name    ${lastname}
    Input Zip/Posta/ Code    ${postcode}

Generate Fake Data
    ${name}=        Faker.Name
    ${lastname}=    Faker.LastName
    ${postcode}=    Faker.Postcode
    RETURN          ${name}    ${lastname}    ${postcode}


Click in Continue Button
    Wait Until Element Is Visible    ${continue_button}
    Click Element    ${continue_button}

Click in Cancel Button
    Wait Until Element Is Visible    ${cancel_button}
    Click Element    ${cancel_button}

Get Payment Information
    ${payment_info}=    Get Text    ${PAYMENT_INFO}
    RETURN    ${payment_info}

Get Item Prices
    ${prices}=    Get WebElements    ${ITEM_PRICES}
    ${total}=     Set Variable    0.0
    FOR    ${element}    IN    @{prices}
        ${price}=    Get Text    ${element}
        ${price}=    Replace String    ${price}    $    ${EMPTY}    # Remove the dollar sign
        ${price}=    Replace String    ${price}    ,    .    # Substitui vírgula por ponto, se necessário
        ${price}=    Convert To Number    ${price}
        ${total}=    Evaluate    ${total} + ${price}
    END
    RETURN    ${total}

Get Item Total
    ${item_total}=    Get Text    ${ITEM_TOTAL}
    ${item_total}=    Replace String    ${item_total}    Item total: $    ${EMPTY}    # Remove the dollar sign
    ${item_total}=    Convert To Number    ${item_total}
    RETURN    ${item_total}

Get Tax
    ${tax}=    Get Text    ${TAX}
    ${tax}=    Replace String    ${tax}    Tax: $    ${EMPTY}    # Remove the dollar sign
    ${tax}=    Convert To Number    ${tax}
    RETURN    ${tax}

Get Total
    ${total}=    Get Text    ${TOTAL}
    ${total}=    Replace String    ${total}    Total: $    ${EMPTY}   # Remove the dollar sign
    ${total}=    Convert To Number    ${total}
    RETURN    ${total}

Assert Values
    ${calculated_item_total}=    Get Item Prices
    Log    Calculated Item Total: ${calculated_item_total}
    ${displayed_item_total}=    Get Item Total
    Log    Displayed Item Total: ${displayed_item_total}
    Should Be Equal As Numbers    ${calculated_item_total}    ${displayed_item_total}
    
    ${tax}=    Get Tax
    Log    Tax: ${tax}
    ${calculated_total}=    Evaluate    ${calculated_item_total} + ${tax}
    Log    Calculated Total: ${calculated_total}
    
    ${displayed_total}=    Get Total
    Log    Displayed Total: ${displayed_total}
    Should Be Equal As Numbers    ${calculated_total}    ${displayed_total}

Get Success Message
    ${Message}=    Get Text    ${SUCCESS_MESSAGE}
    RETURN    ${message}

Go to Finish
    Wait Until Element Is Visible    ${finish_button}
    Click Element    ${finish_button}
    ${success_message}=    Get Success Message
    Log    Success Message: ${success_message}
    Should Be Equal    ${success_message}    ${EXPECTED_MESSAGE}

