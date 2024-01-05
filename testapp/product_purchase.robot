*** Settings ***
Documentation     ****A test suite containing test related to positive scenario,
...               where logged user can buy a product with used valid promo codes.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Buy A Product With Used Promo Codes
    Open Browser To Shop Page
    Select Product Category
    Add Product To The Shopping Cart
    Check Product Exist In The Shopping Cart
    Input Valid Promo Codes
    Sum Payable Should Be Valid
    Go To Payment
    Order Page Should Be Open
    Login To User Account
    Sleep    2
    Pay For Product
    Summary Order Page Should Be Open
    [Teardown]    Close Browser
