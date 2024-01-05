*** Settings ***
Documentation     ****A test suite containing test related to positive scenario,
...               where user can add a product to the shopping cart without login
...               to user account.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Add Product To The Shopping Cart Without Login
    Open Browser To Shop Page
    Select Product Category
    Add Product To The Shopping Cart
    Check Product Exist In The Shopping Cart
    [Teardown]    Close Browser
