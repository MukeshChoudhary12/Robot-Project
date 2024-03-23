*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEFINE_BROW}    chrome
${URL}    https://opensource-demo.orangehrmlive.com/
${USERNAME_TXT}    xpath=//input[@name='username']
${PASSWORD_TXT}    xpath=//input[@name='password']
${LOGIN_BUTTON}    xpath=//button[@type='submit']
${MAINPAGE}    xpath=//div[@class='orangehrm-login-branding']
${DASHBOARD_VERIFY}    xpath=//div[@class='oxd-brand-banner']
${USER_DROP}    xpath=//span[@class='oxd-userdropdown-tab']
${LOG_OUT}    xpath=//a[text()='Logout']

*** Keywords ***
Login into application
    # ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    # Call Method    ${options}    add_argument    --headless
    # create webdriver  Edge  options=${options}
    Open Browser   ${URL}    ${DEFINE_BROW}
    Maximize Browser Window
    Set Browser Implicit Wait    5s       
    Input Text    ${USERNAME_TXT}     Admin
    Input Text    ${PASSWORD_TXT}     admin123
    Click Element    ${LOGIN_BUTTON}    
      
Wait for application to continue
    Set Browser Implicit Wait    5s
    Wait Until Element Is Visible    6s    2s    ${DASHBOARD_VERIFY}
    Page Should Contain Element    ${DASHBOARD_VERIFY}                    
    
Logout of application
    Set Browser Implicit Wait    5s
    Click Element    ${USER_DROP}
    Sleep    1        
    Click Element    ${LOG_OUT} 
    Close Browser
    
*** Test Cases ***
Myfirstcase
    Login into application
    Sleep     5s
    
    
Mysecondtestcase
     Login into application
     Logout of application
