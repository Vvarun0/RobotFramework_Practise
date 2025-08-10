*** Settings ***
Resource         Resources/PageObject/Locators/NavBar_Locators.robot
Resource         Commons.robot
Resource        Resources/Configs/ApplicationVariables.robot
Resource        Resources/Configs/BrowserDetails.robot
Resource        Resources/Configs/EnvDetails.robot
Resource        Resources/Configs/SeleniumConfigs.robot
Resource        Resources/PageObject/Locators/NavBar_Locators.robot



*** Keywords ***
Login To The Application 
    [Arguments]        ${USERNAME}    ${PASSWORD}
    [Documentation]    .... Login using username and password .....
    Open Browser To DemoBlaze Login Page
    Submit Login Information     ${USERNAME}   ${PASSWORD}
    Username Should Be Visible On The Navigation Bar      ${username}

    
Submit Login Information
    [Arguments]         ${USERNAME}     ${password}
    [Documentation]     ...  Login using the username and password  ...
    Set Text            ${usernameTextBox}         ${USERNAME}       ${SMALL_RETRY_COUNT}
    Set Text            ${passwordTextBox}         ${password}       ${SMALL_RETRY_COUNT}
    Click Element       ${loginButton_DemoBlaze}          ${SMALL_RETRY_COUNT}

Open Browser And Login To The Application
    [Documentation]    ...  Open browser and login using valid username and password  ...
    Open Browser To DemoBlaze Login Page
    Login To The Application     ${USERNAME}    ${PASSWORD}

UserName Should be Visible On The Navigation Bar
    [Arguments]             ${username}
    [Documentation]    ...  User should see the username on the navigation bar  ...
    ${loggedInUsernameWithGreeting}   Set Variable    Welcome ${username}
    Element Text Should Be      ${loggedInUsernameWithGreetingLocator}      ${loggedInUsernameWithGreeting}  ${SMALL_RETRY_COUNT}
    
User Should See An Alert With the Error Message
    [Arguments]             ${errorMessage}
    [Documentation]    ...  User should see an alert with the error message on the browser  ...
    Alert Should Be Present    ${errorMessage}

Logout From The Application

