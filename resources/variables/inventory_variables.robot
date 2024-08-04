*** Variables ***
${inventory-container}           xpath://*[@id="inventory_container"]/div
${button-inventory_container}    xpath://*[@id="inventory_container"]/div/div[1]/div[3]/button
${add_to_cart}                   xpath://*[@id="item_{item}_title_link"]//ancestor::div[@class='inventory_item']//button[text()='ADD TO CART']
${remove_from_inventory}          xpath://*[@id="item_{item}_title_link"]//ancestor::div[@class='inventory_item']//button[text()='REMOVE']
${inventory_item}                xpath://div[@class='inventory_item']
${inventory_item_id}             xpath://*[@id="item_{item_id}_title_link"]

${ITEM1}    //div[@class='item'][1]//button[text()='ADD TO CART']
${ITEM2}    //div[@class='item'][2]//button[text()='ADD TO CART']
${ITEM3}    //div[@class='item'][3]//button[text()='ADD TO CART']
${ITEM4}    //div[@class='item'][4]//button[text()='ADD TO CART']
${ITEM5}    //div[@class='item'][5]//button[text()='ADD TO CART']
${ITEM6}    //div[@class='item'][6]//button[text()='ADD TO CART']