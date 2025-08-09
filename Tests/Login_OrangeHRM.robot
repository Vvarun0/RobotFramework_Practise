*** Settings ***
Documentation    Login Test in Robot framework
Resource  ../Resources/PageObject/KeywordDefinitionFiles/LoginPage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/HomePage.robot
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Commons.robot

*** Variables ***
${site_url}  https://opensource-demo.orangehrmlive.com/
${browser}  Chrome

*** Test Cases ***
Verify Successful Login to OrangeHRM
    [Documentation]    This test case verifies that user is able to successfully Login and Logout to orange HRM using page Object
    [Tags]    Smoke
    Opening Browser    ${site_url}    ${browser}
    Input Username
    Input Password
    Click Login
    Verify Dashboard Text Is Visible
    Logout
    Close Browser