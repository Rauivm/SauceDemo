*** Variables ***
${first-name}           //*[@id="first-name"]
${last-name}            //*[@id="last-name"]
${postal-code}          //*[@id="postal-code"]
${continue_button}      //*[@class="btn_primary cart_button"]
${cancel_button}        //*[@id="checkout_info_container"]/div/form/div[2]/a
${finish_button}        //*[@class="btn_action cart_button"]

${ITEM_PRICES}          //div[@class='inventory_item_price']
${PAYMENT_INFO}         //div[@class='summary_value_label']
${ITEM_TOTAL}           //div[@class='summary_subtotal_label']
${TAX}                  //div[@class='summary_tax_label']
${TOTAL}                //div[@class='summary_total_label']
${SUCCESS_MESSAGE}      //h2[@class='complete-header']
${EXPECTED_MESSAGE}     THANK YOU FOR YOUR ORDER
