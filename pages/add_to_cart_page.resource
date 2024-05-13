*** Variables ***
&{dict_add_to_cart_page}
...    sauce_labs_backpack_product=xpath=//div[normalize-space()='Sauce Labs Backpack']
...    product_name=xpath=//div[normalize-space()='Sauce Labs Backpack'] 
...    product_price=xpath=//div[@class='inventory_details_price'][text()='29.99']
...    add_to_cart_button=xpath= //button[@id='add-to-cart']
...    remove_button=xpath=//button[@id='remove'][text()='Remove']



*** Keywords ***
Add the product to the cart
    Click Element                       ${dict_add_to_cart_page}[sauce_labs_backpack_product]  #select the product
    # Page Should Contain Element       xpath=//div[normalize-space()='Sauce Labs Backpack'][text()='Sauce Labs Backpack']    #verify the product name
    Page Should Contain Element         ${dict_add_to_cart_page}[product_name]   #verify the product name
    Page Should Contain Element         ${dict_add_to_cart_page}[product_price]    #verify the product price
    Click Element                       ${dict_add_to_cart_page}[add_to_cart_button]
    Page Should Contain Element         ${dict_add_to_cart_page}[remove_button]

           
