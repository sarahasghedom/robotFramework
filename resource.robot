*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      https://dineshvelhal.github.io/testautomation-playground/login.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    user    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login

Welcome Page Should Be Open
    Title Should Be    Confirmation!

Login Should Have Failed
    [Arguments]     ${error}
    ${error1}    Get Text    message
    Should Be Equal    ${error1}    ${error}