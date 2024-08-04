*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/cart_variables.robot
*** Keywords ***
Verify Items In Cart
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        ${item_locator}=    Set Variable    ${item_cart.replace("{item}","${item}")}
        Element Should Be Visible    ${item_locator}
        Log   ${item_locator}
    END

Remove All Items From Cart
    ${buttons}=    Get WebElements    //button[text()='REMOVE']
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
    END
Remove Items From Cart
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        ${locator}=    Set Variable    ${remove_from_cart.replace("{item}","${item}")}
        Click Element    ${locator}
    END

Cart Is EMPTY
    Element Should Not Be Visible    ${item_cart}

Go to the checkout
    Click Element    ${button_checkout}

