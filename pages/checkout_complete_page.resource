*** Variables ***
&{dict_checkout_complete_page}
...    overview_test=xpath=//span[@class='title'][text()='Checkout: Overview']
...    sauce_labs_name=xpath=//div[@class='inventory_item_name'][text()='Sauce Labs Backpack']
...    subtotal_label= xpath=//div[@class='summary_subtotal_label']
...    inventory_item_price= xpath=//div[@class='inventory_item_price']
...    total_saucelabprice_includetax= xpath=//div[@class='summary_total_label']
...    finish_button=id=finish
...    back_to_products_button=id=back-to-products 

*** Keywords ***        
Verify the product information
    Page Should Contain Element                     ${dict_checkout_complete_page}[overview_test]        #Verify the checkout page
    Page Should Contain Element                     ${dict_checkout_complete_page}[sauce_labs_name]     #verify the product name
    # Get total price
    ${item_price}    Get Text                       ${dict_checkout_complete_page}[subtotal_label]
    ${item_price}    Remove String                  ${item_price}      Item       total       :       $   #convert string to numberic            
    ${item_price}    Convert To Number              ${item_price}
    # Log To console      \n ${total_price}
    # Get the Sauce Labs Backpack price
    ${saucelab_price}    Get Text                   ${dict_checkout_complete_page}[inventory_item_price]
    ${saucelab_price}    Remove String              ${saucelab_price}      $
    ${saucelab_price}    Convert To Number          ${saucelab_price}
    # Compare the total price should be equal
    Should Be True    ${item_price} == ${saucelab_price}
    # Verify Tax
    ${Tax_cal}          evaluate                    (${item_price} * 8)/100
    ${Tax_cal}          Convert To Number           ${Tax_cal}
    ${Tax_cal}          evaluate                    "%.2f" % ${Tax_cal}       #ปัดเหลือเศษ2
    #Compare tax
    ${TAX}              Get Text                    xpath=//div[@class='summary_tax_label']
    ${TAX}              Remove String               ${TAX}      Tax     :       $
    ${TAX}              Convert To Number           ${TAX}
    #Compare the tax should be equal
    Should Be True                                  ${Tax_cal} == ${TAX}
    #Verify the total price + Tax
    ${Pricetotal}        evaluate                   ${Tax_cal} + ${item_price}
    ${Pricetotal}        Convert To Number          ${Pricetotal}
    ${Pricetotal}        evaluate                   "%.2f" % ${Pricetotal}
    #Get the total price + tax should be equal
    ${totalpriceincludetax}                         Get Text               ${dict_checkout_complete_page}[total_saucelabprice_includetax]
    ${totalpriceincludetax}                         Remove String           ${totalpriceincludetax}      Total    :      $
    ${totalpriceincludetax}                         Convert To Number       ${totalpriceincludetax}
    ${totalpriceincludetax}                         evaluate            "%.2f" % ${totalpriceincludetax}       
    #Compare the totalpriceincludetex should be equal
    Should Be True                                  ${totalpriceincludetax} == ${Pricetotal}
    Click Element                                   ${dict_checkout_complete_page}[finish_button]

# Verify complete page
    Page Should Contain Element                     xpath=//h2[@class='complete-header'][text()='Thank you for your order!'] 
    Page Should Contain Button                      ${dict_checkout_complete_page}[back_to_products_button] 
