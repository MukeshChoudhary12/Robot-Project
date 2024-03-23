*** Settings ***
Library    SeleniumLibrary

*** Variables ***



*** Test Cases ***
forlooP
    @{itmes}    Create List    1  2  3  4  5  6
        FOR    ${i}    IN    @{itmes}
                Log    ${i}   
                Exit For Loop If    ${i}==3 
        END