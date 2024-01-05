*** Settings ***
Documentation     ****A test suite containing tests related to positive scenario,
...               where user can add a product to the shopping cart with using
...               valid promo codes, where sum payable will be correct.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Promo Codes
    Open Browser To Shop Page
    Select Product Category
    Add Product To The Shopping Cart
    Check Product Exist In The Shopping Cart
    Input Valid Promo Codes
    Sum Payable Should Be Valid
    [Teardown]    Close Browser
