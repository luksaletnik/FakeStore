*** Settings ***
Documentation     ****A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Valid Username
    Valid Password
    Submit Credentials
    Login Page Should Be Open
    [Teardown]    Close Browser
