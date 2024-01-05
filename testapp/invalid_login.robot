*** Settings ***
Documentation     ****A test suite containing tests related to invalid login.
...
...               This class consist of six test cases with negative scenario,
...               where user cannot login when invalid credentials are used.
...
...               These tests have a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Invalid Username & Valid Password
    Open Browser To Login Page
    Invalid Username
    Valid Password
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

Valid Username & Invalid Password
    Open Browser To Login Page
    Invalid Username
    Invalid Password
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

Empty Username & Valid Password
    Open Browser To Login Page
    Empty Username
    Valid Password
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

Valid Username & Empty Password
    Open Browser To Login Page
    Valid Username
    Empty Password
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

Empty Username & Empty Password
    Open Browser To Login Page
    Empty Username
    Empty Password
    Submit Credentials
    Login Should Have Failed
    [Teardown]    Close Browser

