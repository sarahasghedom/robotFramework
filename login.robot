*** Settings ***
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user "user" logs in with password "password"
    Then welcome page should be open

Invalid Login
    Given browser is opened to login page
    When user "admin" logs in with password "blablabla"
    Then login should fail with error "Incorrect username or password. Try again!!"

*** Keywords ***
Browser is opened to login page
    Open browser to login page

User "${username}" logs in with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Submit credentials

Login should fail with error "${error}"
    Login Should Have Failed    ${error}