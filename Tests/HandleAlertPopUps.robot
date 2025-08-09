*** Settings ***
Library    SeleniumLibrary
Resource  ../Resources/PageObject/KeywordDefinitionFiles/Commons.robot

*** Variables ***
${HandleAppUrl}  https://the-internet.herokuapp.com/javascript_alerts
${browser}        chrome
${IframeAppUrl}     https://ui.vision/demo/webtest/frames

*** Test Cases ***
Launch JS Application
    Open Browser    ${HandleAppUrl}    ${browser}
    Maximize Browser Window
    Sleep    3
    Handle JS Alerts
    Handle JS Confirm
    Handle JS Prompt    Hey Varun
    Close Browser