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
${LOG_OUT}    xpath=//a[text()='Logout']

*** Keywords ***
Login into application
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Set Browser Implicit Wait    5s       
    Input Text    ${USERNAME_TXT}     Admin
    Input Text    ${PASSWORD_TXT}     admin123
    Click Element    ${LOGIN_BUTTON}    
      
Wait for application to continue
    Set Browser Implicit Wait    5s
    Wait Until Element Is Visible    6s    2s    ${DASHBOARD_VERIFY}
    Page Should Contain Element    ${DASHBOARD_VERIFY}                    
    
Input_Text_Search
    [Arguments]    ${searchkeyword}
    Input Text    ${SEARCH_BUTT}    ${searchkeyword}
    
Click_Search_Button
    Click Element    ${SIDE_MENU_COLLAPSE}  
    Sleep    0.5    
    Click Element    ${SIDE_MENU_COLLAPSE}  
Verify_search  
    Wait Until Keyword Succeeds    6s    2s    Press Keys     ${SEARCH_BUTT}     CTRL+a  
    Sleep    1     
    Wait Until Keyword Succeeds    6s    2s    Press Keys     ${SEARCH_BUTT}     BACKSPACE    ENTER
    
Logout of application
    Set Browser Implicit Wait    5s
    Click Element    ${USER_DROP}
    Sleep    1        
    Click Element    ${LOG_OUT} 
    Close Browser
    
*** Test Cases ***
Myfirstcase
    Login into application
    Sleep    4   
    @{all_text}=    Create List    ${SIDE_PANEL}     
    FOR  ${elements}  IN  @{all_text}     
         ${text}=    Get Text    ${elements}
         Set Selenium Implicit Wait    2
         Input_Text_Search    ${text}
         Click_Search_Button    
         Verify_search              
    END  
    Logout of application
    