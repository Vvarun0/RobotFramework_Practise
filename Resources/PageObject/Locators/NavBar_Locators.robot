*** Variables ***
${loginLocator}                             xpath=//*[@id="login2"]
${logoutLocator}                            id=logout2
${loggedInUsernameWithGreetingLocator}      xpath=//*[@id='nameofuser']

*** Keywords ***
Get Navigation Menu Locator By Name
    [Arguments]           ${menuItemName}
    [Documentation]  ...  Get navigation menu item locator by name  ... 
    ${menuItemLocator}     Set Variable     xpath=//a[@class='nav-link' and contains(text(), '${menuItemName}')]
    Return From Keyword    ${menuItemLocator}