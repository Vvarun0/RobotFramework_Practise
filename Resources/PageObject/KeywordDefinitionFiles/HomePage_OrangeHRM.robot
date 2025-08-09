*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/TestData.py

*** Keywords ***
Verify Dashboard Text is Visible
    Wait Until Element Is Visible    ${DashBoardText}    timeout=15s

Logout
    CLick Element  ${UserDropdown}
    Wait Until Element Is Visible  ${LogoutButton}  timeout=5
    Click Element  ${LogoutButton}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5
