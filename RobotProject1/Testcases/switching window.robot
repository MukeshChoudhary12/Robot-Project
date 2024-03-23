*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Switching of the windows
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To    https://demo.automationtesting.in/Windows.html   
    Maximize Browser Window
    Sleep    2
    Click Element      xpath=//*[@id="Tabbed"]/a/button
    Sleep    2