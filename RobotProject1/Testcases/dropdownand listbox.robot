*** Settings ***
Library    SeleniumLibrary




*** Variables ***
${URL}    https://demo.automationtesting.in/Register.html   
${BROWSER}    Edge  
${SKILLS_DROP}    xpath=//select[@id='Skills']


*** Test Cases ***
Selecting dropdown and list boxes
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    ${URL}    
    Maximize Browser Window
    Sleep    2
    Select From List By Label     ${SKILLS_DROP}    Mobile   
    Sleep    2
    Select From List By Index    ${SKILLS_DROP}     3 
    

