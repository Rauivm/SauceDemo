*** Settings ***
Resource    common.robot
Resource   ../variables/inventory_variables.robot
Library    SeleniumLibrary
Library    String


*** Keywords ***

Add All Items
    ${buttons}=    Get WebElements    //button[text()='ADD TO CART']
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
    END

Remove All Items
    ${buttons}=    Get WebElements    //button[text()='REMOVE']
    FOR    ${button}    IN    @{buttons}
        Click Element    ${button}
    END
Remove Items From Inventory
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        ${locator}=    Set Variable    ${remove_from_inventory.replace("{item}","${item}")}
        Click Element    ${locator}
    END

Add Items To Cart
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        ${locator}=    Set Variable    ${add_to_cart.replace("{item}","${item}")}
        Click Element    ${locator}
    END

Visualize All items
    [Arguments]       @{items}
    FOR    ${item}    IN    @{items}
        ${item_locator}=    Set Variable    ${inventory_item_id.replace("{item_id}","${item}")} 
        Element Should Be Visible    ${item_locator}
        Log   ${item_locator}
    END


Verificar Item na Lista
    ${items} =    Create List    0    1    2    3    4    5
    FOR    ${item}    IN    @{items}
        Visualize All items    ${item}
    END