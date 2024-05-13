*** Variables ***
&{dict_login_page}            
...    input_username=id=user-name
...    input_password=id=password 
...    login_logo=//div[@class='login_logo'][text()='Swag Labs'] 
...    login_button=id=login-button
...    product_title=//div//span[@class='title'][text()='Products']


*** Keywords ***
Login 
    [Arguments]     ${username}    ${password}
    Open Browser          https://www.saucedemo.com/     browser=chrome
    ...    options=binary_location=r"C:\\Chrome\\chrome-win64\\chrome.exe"    #;add_experimental_option("detach", True)    
    ...    executable_path=C:\\Chrome\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe
    Maximize Browser Window                                                                                     #Expand window    
    # Set Selenium Speed  0.3s                                                                                  #กำหนดให้ทุก action 0.1 วินาที 
    # Input Text                      ${dict_login_page}[input_username]            standard_user               #input username
     Input Text                     ${dict_login_page}[input_username]           ${username}                    #input username
    Input Text                      ${dict_login_page}[input_password]           ${password}                    #input password
    Textfield Should Contain        ${dict_login_page}[input_username]           ${username}                    #Verify username
    Page Should Contain Element     ${dict_login_page}[login_logo]                                              #Verify the Login page is displayed 'Swag labs'
    Textfield Should Contain        ${dict_login_page}[input_password]           ${password}                    #Verify assword   
    Click Button                    ${dict_login_page}[login_button]                                            #click login
    Page Should Contain Element     ${dict_login_page}[product_title]                                           #Verify the Login page is displayed 'Products'