*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://accounts.google.com/
${USERNAME}         abhijit.som82@gmail.com
${PASSWORD}         password
${BROWSER}          chrome
${CHROMEDRIVER_PATH}    C://Users/soma/PycharmProjects/Robot-Framework-Python-Project/Driver/chromedriver-win64/chromedriver.exe

*** Test Cases ***
User Should Be Able To Login Successfully
    [Documentation]    Test to verify successful login
    Open Browser    ${LOGIN_URL}    ${BROWSER}     executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window
    Wait Until Element Is Visible     id:identifierId    10
    Input Text    id:identifierId    ${USERNAME}
    Wait Until Element Is Visible     id:password    30
    Input Text    id:password    ${PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible    xpath://h1[contains(text(), 'Dashboard')]    10
    Element Should Be Visible    xpath://h1[contains(text(), 'Dashboard')]
    Close Browser