*** Settings ***

Library    SeleniumLibrary

*** Variables ***



*** Test Cases ***
Tablehandling
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    https://testautomationpractice.blogspot.com/   
    Maximize Browser Window
    Sleep    2    
    ${getcount}=    Get Element Count    //table[@name='BookTable']//tr//th
    Log To Console    ${getcount}    

