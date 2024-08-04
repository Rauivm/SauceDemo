*** Variables ***
${item_cart}             //a[contains(@href, 'inventory-item.html?id={item}')]
${shopping_cart_link}    //*[@id="shopping_cart_container"]/a
${button_checkout}       //*[@class="btn_action checkout_button"]

${remove_from_cart}                   xpath://*[@id="item_{item}_title_link"]//ancestor::div[@class='cart_item']//button[text()='REMOVE']
