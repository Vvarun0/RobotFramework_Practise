*** Settings ***
Library      SeleniumLibrary
Library      String
Library      OperatingSystem

Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py
Resource    Resources/Configs/ApplicationVariables.robot
Resource    Resources/Configs/BrowserDetails.robot
Resource    Resources/Configs/EnvDetails.robot
Resource    Resources/Configs/SeleniumConfigs.robot
Resource    Resources/PageObject/Locators/NavBar_Locators.robot

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

Open Browser To DemoBlaze Login Page
    [Documentation]    ...  Open the browser and navigates to the login page  ...
    Open Browser            ${TEST_ENV_URL}       ${BROWSER}
    Set Window Size         ${WINDOW_WIDTH}       ${WINDOW_HEIGHT}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Click Element           xpath=//*[@id="login2"]      2x
    Set Log Level            DEBUG


Logout From DemoBlaze Application
    [Documentation]        ...  Logout from the application  ...
    Click Element                ${logoutLocator}      ${SMALL_RETRY_COUNT}
    Element Should Be Visible    ${loginLocator}       ${SMALL_RETRY_COUNT}

Get Random Text
    [Documentation]        ...  Return random text value  ...
    ${randomText}          Generate Random String    8    [Letters]
    Return From Keyword    ${randomText}

Get Current Epoch Time
    [Documentation]       ...  Return current epoch time  ...
    ${randomText}         Get Time    epoch
    Return From Keyword     ${randomText}

Element Should be contained in the Page
     [Arguments]                  ${locator}     ${retryScale}
     [Documentation]        ...  Verify that the element should be contained in the page  ...
     Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}      Wait Until Page Contains Element    ${locator}

Element Should Not Be Visible
    [Arguments]            ${locator}             ${retryScale}
    [Documentation]        ...  Verify that the element should not be visible  ...
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Not Visible   ${locator}

Click Element
    [Arguments]    ${locator}    ${retryScale}
    [Documentation]    Click on a given button with retry logic
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    Wait Until Element Is Enabled    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}    ${RETRY_DELAY}    SeleniumLibrary.Click Element    ${locator}


Click Element By JavaScript Executor 
    [Arguments]                     ${elementXpathLocator}         ${retryScale}
    [Documentation]               ...  Click an element by xpath using javascript executor  ...
    Wait Until Keyword Succeeds        ${retryScale}               ${RETRY_DELAY}    Wait Until Element Is Enabled    ${elementXpathLocator}
    ${elementXpathLocator}=    Remove String        ${elementXpathLocator}   xpath= Execute JavaScript  document.evaluate("${elementXpathLocator}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();


Element Text Should Be
    [Arguments]            ${locator}     ${text}     ${retryScale}
    [Documentation]        ...  Validate the text of an element  ...
    Wait Until Keyword Succeeds     ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}     SeleniumLibrary.Element Text Should Be       ${locator}    ${text}
    
Set Text
    [Arguments]            ${textBoxLocator}    ${text}    ${retryScale}
    [Documentation]       ...  Input text into a text box  ...
    Wait Until Keyword Succeeds    ${retryScale}    ${Retry_Delay}    Wait Until Element Is Enabled        ${textBoxLocator}
    Wait Until Keyword Succeeds     ${retryScale}     ${RETRY_DELAY}    Input Text    ${textBoxLocator}    ${text}

Scroll To The Top Of The Page
    [Documentation]
	...  Scroll to the top of the page
	
    Execute JavaScript    window.scrollTo(0, 0)
      
	  
Scroll To The Bottom Of The Page
    [Documentation]        ...  Scroll to the bottom of the page
	
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)