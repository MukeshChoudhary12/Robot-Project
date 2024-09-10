***Settings***

Library     SeleniumLibrary

Resource     ../common.robot


***Keyword***
Wait for application to continue
    Set Browser Implicit Wait    5s
    Wait Until Element Is Visible    6s    2s    ${DASHBOARD_VERIFY}
    Page Should Contain Element    ${DASHBOARD_VERIFY}