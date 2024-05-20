*** Settings ***
Test Setup        BuiltIn.Set library search order    SeleniumLibrary                                                         
Resource          ${CURDIR}/../config/import.resource


*** Test Cases ***
E2E_Buy_product_success
    Login                                   ${TC_001.server}   ${TC_001.browser}   ${TC_001.user_name}      ${TC_001.pwd}
    Filter the product
    Add the product to the cart
    Check out the product 
    Input information                       ${TC_001.first_name}     ${TC_001.last_name}       ${TC_001.zip}
    Verify the product information


