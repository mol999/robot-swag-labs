
*** Settings ***
Library     SeleniumLibrary
Library     String

# pages
Resource    ${CURDIR}/../pages/login_page.resource
Resource    ${CURDIR}/../pages/home_page.resource
Resource    ${CURDIR}/../pages/add_to_cart_page.resource
Resource    ${CURDIR}/../pages/checkout_page.resource
Resource    ${CURDIR}/../pages/checkout_info_page.resource
Resource    ${CURDIR}/../pages/checkout_complete_page.resource

# variable
Variables        ${CURDIR}/../test_data/data.yaml