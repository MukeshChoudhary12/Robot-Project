*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://demo.automationtesting.in/Register.html
${BROWSER}    Edge
${HOME}    xpath=//a[text()='Home']

*** Test Cases ***
Radio button checkbox check
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    ${URL}   
    Maximize Browser Window
    Set Selenium Implicit Wait    2
    Select Radio Button    radiooptions    Male
    Sleep    3
    Select Radio Button    radiooptions    FeMale
    Sleep    3
    Select Checkbox    id=checkbox1
    Select Checkbox    id=checkbox2
    Select Checkbox    id=checkbox3
    Sleep    3
    Unselect Checkbox    id=checkbox1
    Unselect Checkbox    id=checkbox2
    Unselect Checkbox    id=checkbox3 
    Sleep   1
    
*** Keywords ***
