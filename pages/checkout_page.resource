*** Variables ***
&{dict_checkout_page}
...    shoping_cart_logo=id=shopping_cart_container
...    shopping_cart_badge=xpath=//span[@class='shopping_cart_badge'][text()='1']
...    checkout_logo=id=checkout

*** Keywords ***        
Check out the product 
    Click Element                   ${dict_checkout_page}[shoping_cart_logo]
    Page Should Contain Element     ${dict_checkout_page}[shopping_cart_badge]
    Click Element                   ${dict_checkout_page}[checkout_logo]