*** Settings ***
Library     SeleniumLibrary
Library     String

*** Test Cases ***

E2E_Buy_product_success
    Log    Helloworld
    Login 
    Filter the product
    Add the product to the cart
    Check out the product 
    Input information
    Verify the product information


*** Keywords ***
Login 
    Open Browser          https://www.saucedemo.com/     browser=chrome
    ...    options=binary_location=r"C:\\Chrome\\chrome-win64\\chrome.exe"    #;add_experimental_option("detach", True)    
    ...    executable_path=C:\\Chrome\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe
    Maximize Browser Window                                                              #Expand window    
    # Set Selenium Speed  0.3s                                                             #กำหนดให้ทุก action 0.1 วินาที 
    Input Text                      id=user-name            standard_user               #input username
    Input Text                      id=password             secret_sauce                  #input password
    Textfield Should Contain        id=user-name          standard_user                      #Verify username
    Page Should Contain Element     //div[@class='login_logo'][text()='Swag Labs']       #Verify the Login page is displayed 'Swag labs' 
    Textfield Should Contain        id=password         secret_sauce                      #Verify assword   
    Click Button                    id=login-button                                      #click login
    Page Should Contain Element     //div//span[@class='title'][text()='Products']       #Verify the Login page is displayed 'Products'

Filter the product
    Click Element                   xpath=//div//select[@class='product_sort_container']
    # Select From List By Index     xpath=//div//select[@class='product_sort_container']    3  #เลือกเป๋นลำดับของ Index
    Select From List By Value       xpath=//div//select[@class='product_sort_container']    hilo
    Page Should Contain Element     xpath=//div//select[@class='product_sort_container']    hilo   #Verify the filter option

Add the product to the cart
    Click Element                   xpath=//div[normalize-space()='Sauce Labs Backpack']  #select the product
    # Page Should Contain Element     xpath=//div[normalize-space()='Sauce Labs Backpack'][text()='Sauce Labs Backpack']    #verify the product name
    Page Should Contain Element     xpath=//div[@class='inventory_details_name large_size'][text()='Sauce Labs Backpack']   #verify the product name
    Page Should Contain Element     xpath=//div[@class='inventory_details_price'][text()='29.99']    #verify the product price
    Click Element                   xpath= //button[@id='add-to-cart']
    Page Should Contain Element     xpath=//button[@id='remove'][text()='Remove']           

Check out the product 
    Click Element                   id=shopping_cart_container
    Page Should Contain Element     xpath=//span[@class='shopping_cart_badge'][text()='1']
    Click Element                   id=checkout

Input information 
    Input Text                      id=first-name           hakuna
    Input Text                      id=last-name            matata
    Input Text                      id=postal-code          10230
    Click Element                   id=continue

Verify the product information
    Page Should Contain Element     xpath=//span[@class='title'][text()='Checkout: Overview']    #Verify the checkout page
    Page Should Contain Element     xpath=//div[@class='inventory_item_name'][text()='Sauce Labs Backpack']     #verify the product name
    # Get total price
    ${item_price}    Get Text              xpath=//div[@class='summary_subtotal_label']
    ${item_price}    Remove String         ${item_price}      Item       total       :       $   #convert string to numberic            
    ${item_price}    Convert To Number     ${item_price}
    # Log To console      \n ${total_price}
    # Get the Sauce Labs Backpack price
    ${saucelab_price}    Get Text              xpath=//div[@class='inventory_item_price']
    ${saucelab_price}    Remove String         ${saucelab_price}      $
    ${saucelab_price}    Convert To Number     ${saucelab_price}
    # Compare the total price should be equal
    Should Be True    ${item_price} == ${saucelab_price}
    # Verify Tax
    ${Tax_cal}          evaluate             (${item_price} * 8)/100
    ${Tax_cal}          Convert To Number    ${Tax_cal}
    ${Tax_cal}          evaluate             "%.2f" % ${Tax_cal}       #ปัดเหลือเศษ2
    #Compare tax
    ${TAX}              Get Text             xpath=//div[@class='summary_tax_label']
    ${TAX}              Remove String                  ${TAX}      Tax     :       $
    ${TAX}              Convert To Number              ${TAX}
    #Compare the tax should be equal
    Should Be True                           ${Tax_cal} == ${TAX}
    #Verify the total price + Tax
    ${Pricetotal}        evaluate            ${Tax_cal} + ${item_price}
    ${Pricetotal}        Convert To Number   ${Pricetotal}
    ${Pricetotal}        evaluate            "%.2f" % ${Pricetotal}
    #Get the total price + tax should be equal
    ${totalpriceincludetax}                  Get Text                xpath=//div[@class='summary_total_label']
    ${totalpriceincludetax}                  Remove String           ${totalpriceincludetax}      Total    :      $
    ${totalpriceincludetax}                  Convert To Number       ${totalpriceincludetax}
    ${totalpriceincludetax}                  evaluate            "%.2f" % ${totalpriceincludetax}       
    #Compare the totalpriceincludetex should be equal
    Should Be True                           ${totalpriceincludetax} == ${Pricetotal}
    Click Element                            id=finish

# Verify complete page
    Page Should Contain Element              xpath=//h2[@class='complete-header'][text()='Thank you for your order!'] 
    Page Should Contain Button               id=back-to-products 



