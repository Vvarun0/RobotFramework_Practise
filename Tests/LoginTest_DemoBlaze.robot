*** Settings ***
Resource           ../Resources/PageObject/Locators/LoginPage_Locators.robot
Resource            Resources/Configs/ApplicationVariables.robot
Resource            Resources/PageObject/KeywordDefinitionFiles/LoginPage_DemoBlaze.robot
Documentation        This suite includes login tests
Test Teardown        Close Browser

*** Variables ***
${invalidUserName}                       varun
${invalidPassword}                       test@12
${WRONG_PASSWORD_ERROR_MESSAGE}          Wrong password.
${USER_DOES_NOT_EXIST_ERROR_MESSAGE}     Wrong password.

*** Test Cases ***
Verify That An Unregistered Person Cannot Login To the Application
    [Documentation]    Verify that an unregistered person cannot login to the application

    [Tags]    Regression
    Open Browser To DemoBlaze Login Page
    Submit Login Information    ${invalidUserName}    ${invalidPassword}
    User Should See An Alert With The Error Message    ${USER_DOES_NOT_EXIST_ERROR_MESSAGE}
    
Verify That A Registered User Cannot Login To Application Using Wrong Password
    [Documentation]    Verify that a Registered person cannot login to the application
    [Tags]    Regression
    Open Browser To DemoBlaze Login Page
    Submit Login Information

Verify that a Registered User Can Login To Application Using The Correct Username and Password
    [Documentation]   Verify that a registered user can login to the application using the correct password
    [Tags]    Smoke
    Login To The Application      ${USERNAME}         ${PASSWORD}
#    Logout From The Application
