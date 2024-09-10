***Settings***

Library     SeleniumLibrary

Resource     ../common.robot

***Keywords***

Login into application
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    go to   ${URL}
    Maximize Browser Window
    Set Browser Implicit Wait    5s       
    Input Text    ${USERNAME_TXT}     Admin
    Input Text    ${PASSWORD_TXT}     admin123
    Click Element    ${LOGIN_BUTTON}
    
Logout of application
    Set Browser Implicit Wait    5s
    Click Element    ${USER_DROP}
    Sleep    1        
    Click Element    ${LOG_OUT} 
    Close Browser