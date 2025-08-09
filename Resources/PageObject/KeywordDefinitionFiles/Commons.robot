*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Opening Browser
    [Arguments]    ${site_url}    ${browser}
    Open Browser  ${site_url}      ${browser}
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5


Handle JS Alerts
    Click Element     ${AlertXpath}
    Sleep    3
    Handle Alert    accept  #click on Okay button
    Sleep    3

Handle JS Confirm
    Click Element    ${AlertConfirmXpath}
    Handle Alert    dismiss
    Sleep    2
    Page Should Contain Element    ${AlertResult}

Handle JS Prompt
    [Arguments]    ${AlertPromptMsg}
    Click Element    ${AlertPrompt}
    Sleep        2
#    Alert Should Be Present    I am a JS prompt
    Input Text Into Alert    ${AlertPromptMsg}
    Sleep         2
    Page Should Contain     ${AlertPromptMsg}
    

