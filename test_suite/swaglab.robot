*** Settings ***
Resource    ${CURDIR}/../config/import.resource

*** Test Cases ***

E2E_Buy_product_success
    Log    Helloworld
    Login 
    Filter the product
    Add the product to the cart
    Check out the product 
    Input information
    Verify the product information


