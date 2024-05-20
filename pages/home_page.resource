*** Variables ***
&{dict_home_page}
...    filter_buton=xpath=//div//select[@class='product_sort_container']
...    list_by_value_filter=xpath=//div//select[@class='product_sort_container']
...    filter_option=xpath=//div//select[@class='product_sort_container']

*** Keywords ***
Filter the product
    Click Element                       ${dict_home_page}[filter_buton]
    # Select From List By Index         xpath=//div//select[@class='product_sort_container']    3  #เลือกเป๋นลำดับของ Index
    Select From List By Value           ${dict_home_page}[list_by_value_filter]    hilo
    Page Should Contain Element         ${dict_home_page}[filter_option]    hilo   #Verify the filter option