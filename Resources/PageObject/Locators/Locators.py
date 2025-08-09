# Login Page locators
LoginUsernameInputBox = "//*[@name = 'username']"
LoginPasswordInputBox = "//*[@name = 'password']"
LoginButton = "//*[@type='submit']"

# Home Page Locators
DashBoardText = "xpath://*[@id='app']//h6[text()='Dashboard']"
UserDropdown= "*//li[contains(@class ,'userdropdown')]"
LogoutButton = "css:[href=\"/web/index.php/auth/logout\"]"

#JavaScript Alerts Locators
AlertXpath = "xpath://button[contains(text(),'Click for JS Alert')]"
AlertConfirmXpath = "xpath://button[contains(text(),'Click for JS Confirm')]"
AlertSuccessMsg = "xpath://p[contains(normalize-space(text()),'You successfully clicked an alert')]"
AlertPrompt = "xpath://button[contains(text(),'Click for JS Prompt')]"
AlertResult = "xpath://p[@id='result']"