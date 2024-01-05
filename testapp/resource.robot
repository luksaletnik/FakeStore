*** Settings ***
Documentation     ****A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}                https://fakestore.testelka.pl/
${BROWSER}            Firefox
${DELAY}              0
${VALID_USER}         tester.21633
${VALID_PASSWORD}     test_demo_21633
${INVALID_USER}       invalid
${INVALID_PASSWORD}   invalid
${LOGIN_URL}          https://fakestore.testelka.pl/moje-konto/
${SHOP_URL}           https://fakestore.testelka.pl/shop/
${CART_URL}           https://fakestore.testelka.pl/koszyk/

# Valid Promo Codes:
${PC_250}    kwotowy250
${PC_10%}    10procent
${PC_300}    kwotowy300
${PC_30P}    kwotowy300bezpromocji
#${PC_10S}    10procent1
${PC_350}    windsurfing350

# Valid Debit/Credit Card Data
${CARD_NUMB}    4242424242424242
${EXP_DATE}     1230
${CVC_NUMB}     123

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Moje konto – FakeStore

Valid Username
    Input Text    id:username    ${VALID_USER}

Valid Password
    Input Text    id:password    ${VALID_PASSWORD}

Invalid Username
    Input Text    id:username    ${INVALID_USER}

Invalid Password
    Input Text    id:password    ${INVALID_PASSWORD}

Empty Username
    Input Text    id:username    ${EMPTY}

Empty Password
    Input Text    id:password    ${EMPTY}

Submit Credentials
    Hide Dismiss Link Notice
    Click Element    xpath://*[@id="customer_login"]/div[1]/form/p[3]/button

Hide Dismiss Link Notice
    Click Element    xpath:/html/body/p/a

Login Should Have Failed
    Page Should Contain Element    class:woocommerce-error

Open Browser To Shop Page
    Open Browser    ${SHOP_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Hide Dismiss Link Notice
    Shop Page Should Be Open

Shop Page Should Be Open
    Title Should Be    Sklep – FakeStore

# Product Category: e.g. Windsurfing
Select Product Category
    Click Element    xpath://*[@id="main"]/ul/li[1]/a/h2

# Add to cart: “Egipt - El Gouna”
Add Product To The Shopping Cart
    Click Element    xpath://*[@id="main"]/ul/li[1]/a[2]

Check Product Exist In The Shopping Cart
    Wait Until Element Is Visible    xpath://*[@id="main"]/ul/li[1]/a[3]
    Click Element   xpath://*[@id="main"]/ul/li[1]/a[3]
    Page Should Contain    Egipt - El Gouna

Input Valid Promo Codes
    Input Text    id:coupon_code    ${PC_250}
    Apply Voucher
    Sleep    2
    Input Text    id:coupon_code    ${PC_10%}
    Apply Voucher
    Sleep    2
    Input Text    id:coupon_code    ${PC_300}
    Apply Voucher
    Sleep    2
    Input Text    id:coupon_code    ${PC_30P}
    Apply Voucher
    Sleep    2
    Input Text    id:coupon_code    ${PC_350}
    Apply Voucher

Apply Voucher
    Click Element    class:button

Sum Payable Should Be Valid
    Wait Until Element Is Visible    xpath://*[@id="post-6"]/div/div/div[2]/div/table/tbody/tr[7]/td/strong/span
    Element Should Contain    xpath://*[@id="post-6"]/div/div/div[2]/div/table/tbody/tr[7]/td/strong/span    1 860,00

Go To Payment
    Click Element    xpath:/html/body/div/div[2]/div/div[2]/main/article/div/div/div[2]/div/div/a

Order Page Should Be Open
    Title Should Be    Zamówienie – FakeStore

Login To User Account
    Click Element    class:showlogin
    Valid Username
    Valid Password
    Log In

Log In
    Click Element    xpath:/html/body/div/div[2]/div/div[1]/main/article/div/div/form[1]/p[4]/button

Pay For Product
    Click Element    xpath://*[@id="terms"]
    Click Element    xpath://*[@id="place_order"]

Summary Order Page Should Be Open
    Title Should Be    Zamówienie – FakeStore
    