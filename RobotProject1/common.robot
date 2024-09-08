***Settings***

Library     SeleniumLibrary

*** Variables ***
${DEFINE_BROW}    Edge
${URL}    https://opensource-demo.orangehrmlive.com/
${USERNAME_TXT}    xpath=//input[@name='username']
${PASSWORD_TXT}    xpath=//input[@name='password']
${LOGIN_BUTTON}    xpath=//button[@type='submit']
${MAINPAGE}    xpath=//div[@class='orangehrm-login-branding']
${DASHBOARD_VERIFY}    xpath=//div[@class='oxd-brand-banner']
${USER_DROP}    xpath=//span[@class='oxd-userdropdown-tab']
${LOG_OUT}    xpath=//a[text()='Logout']