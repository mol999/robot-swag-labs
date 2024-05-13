

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