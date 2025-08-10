*** Keywords ***
Get Category Locator By Name
    [Arguments]    ${categoryName}
    [Documentation]    ..... Get Category locator By Name .....
    ${categoryLocator}     Set Variable        xpath=//a[@id='itemc' and text()='${categoryName}']
    Return From Keyword    ${categoryLocator}