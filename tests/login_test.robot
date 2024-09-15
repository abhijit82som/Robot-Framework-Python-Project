*** Settings ***
Library    SeleniumLibrary
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://www.linkedin.com/home
${USERNAME}         abhijit.som10@gmail.com
${PASSWORD}         Loknath@1234
${BROWSER}          chrome
${CHROMEDRIVER_PATH}    C://Users/soma/PycharmProjects/Robot-Framework-Python-Project/Driver/chromedriver-win64/chromedriver.exe
@{CHROME_OPTIONS}    --disable-infobars    --disable-extensions    --disable-popup-blocking    --remote-allow-origins=*
*** Test Cases ***
User Should Be Able To Login Successfully
    [Documentation]    Test to verify successful login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --remote-allow-origins
    Create WebDriver    Chrome    options=${options}
    Go To    ${LOGIN_URL}
    Maximize Browser Window
    Wait Until Element Is Visible     xpath://a[normalize-space(text())='Sign in with email']   60
    Wait Until Element Is Visible     xpath://a[normalize-space(text())='Sign in']    60
    Click Link    xpath://a[normalize-space(text())='Sign in']
    Wait Until Element Is Visible     id:password    120
    Input Text    id:username   ${USERNAME}
    Input Text    id:password   ${PASSWORD}
    Click Button    xpath://button[normalize-space(text())='Sign in']
    Wait Until Element Is Visible    xpath://a[@class="ember-view block"]//following-sibling::div//following-sibling::div    600
    Element Should Be Visible    xpath://a[@class="ember-view block"]//following-sibling::div//following-sibling::div
    Close Browser