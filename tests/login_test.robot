*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://accounts.google.com/
${USERNAME}         abhijit.som82@gmail.com
${PASSWORD}         password
${BROWSER}          chrome

*** Test Cases ***
User Should Be Able To Login Successfully
    [Documentation]    Test to verify successful login
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible     id:identifierId    50
    Input Text    id:identifierId    ${USERNAME}
    Wait Until Element Is Visible     id:password    30
    Input Text    id:password    ${PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible    xpath://h1[contains(text(), 'Dashboard')]    10
    Element Should Be Visible    xpath://h1[contains(text(), 'Dashboard')]
    Close Browser
