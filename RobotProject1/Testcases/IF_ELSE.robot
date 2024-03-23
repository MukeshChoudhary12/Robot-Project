*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFINE_BROW}    Edge
${URL}    https://opensource-demo.orangehrmlive.com/
${USERNAME_TXT}    xpath=//input[@name='username']
${PASSWORD_TXT}    xpath=//input[@name='password']
${LOGIN_BUTTON}    xpath=//button[@type='submit']
${MAINPAGE}    xpath=//div[@class='orangehrm-login-branding']
${DASHBOARD_VERIFY}    xpath=//div[@class='oxd-brand-banner']
${USER_DROP}    xpath=//span[@class='oxd-userdropdown-tab']
${SIDE_PANEL}    xpath=//div[@class='oxd-sidepanel-body']
${ADMIN_CLICK}    xpath=//a[@class='oxd-main-menu-item active']
${JOB_CLICK}    xpath=//span[text()='Job ']
${JOB_DROP}    xpath=//ul[@class='oxd-dropdown-menu']
${SIDE_MENU_COLLAPSE}    xpath=//button[@class="oxd-icon-button oxd-main-menu-button"]
${SEARCH_BUTT}    xpath=//input[@class="oxd-input oxd-input--active"]
${ADMIN_DROP}    xpath=//span[text()='Admin']
${DROP_TEXT_SEARCH}    xpath=//a[@class='oxd-main-menu-item']
${LOG_OUT}    xpath=//a[text()='Logout']

*** Test Cases ***
Myfirstcase
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    ${URL}   
    Maximize Browser Window
    Set Browser Implicit Wait    5s       
    Input Text    ${USERNAME_TXT}     Admin
    Input Text    ${PASSWORD_TXT}     admin123
    Click Element    ${LOGIN_BUTTON}  
    Sleep    4   
    ${links}=    Get Element Count    xpath://a
    
    FOR    ${i}  IN RANGE    1    ${links} 
        ${text}=    Get Text   xpath:(//a)[${i}]
        Log To Console    ${text}
    END
   
         
