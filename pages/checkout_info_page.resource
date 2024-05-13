*** Variables ***
&{dict_checkout_info}
...    firstname_field=id=first-name 
...    lastname_field=id=last-name
...    postal_field=id=postal-code 
...    continue_button=id=continue


*** Keywords ***        
Input information     
    [Arguments]     ${firstname}    ${lastname}      ${zip}
    Input Text                      ${dict_checkout_info}[firstname_field]           ${firstname}
    Input Text                      ${dict_checkout_info}[lastname_field]            ${lastname}
    Input Text                      ${dict_checkout_info}[postal_field]              ${zip}
    Click Element                   ${dict_checkout_info}[continue_button]