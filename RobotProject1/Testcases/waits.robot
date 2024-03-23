*** Settings ***
Library    SeleniumLibrary





*** Variables ***
${browser}    Edge
${url}    https://demo.automationtesting.in/Register.html
${address}    pavan plaza gopalpatti near manjari railway station pune 412307


*** Test Cases ***
checkwaits
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].EdgeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    create webdriver  Edge  options=${options}
    Go To   ${url}
    Maximize Browser Window
    Wait Until Page Contains    Register    
    Set Selenium Implicit Wait    1
    Input Text    //*[@id="basicBootstrapForm"]/div[1]/div[1]/input    Mukesh    
    Input Text    //*[@id="basicBootstrapForm"]/div[1]/div[2]/input    Choudhary
    Input Text    //*[@id="basicBootstrapForm"]/div[2]/div/textarea    ${address}    
    Input Text    //*[@id="eid"]/input    mukesh@gmail.com    
    Input Text    //*[@id="basicBootstrapForm"]/div[4]/div/input    8888888888    
    Select Radio Button    radiooptions    Male
    Select Checkbox    id=checkbox1
    Sleep    1
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Sleep    3
    Execute Javascript    window.scrollTo(0,-document.body.scrollHeight)
    Sleep    2    
    


*** Keywords ***
