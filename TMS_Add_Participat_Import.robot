*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  0
${txtUSER}		  vdriconext
${txtPASSWORD}    airasia@123
${LOGIN URL}      https://red-u.thaiairasia.co.th/training-admin/Account/Login


*** Test Cases ***
TC001 Valid Login
	Open Browser To Login Page
	Input Text   Username      ${txtUSER}
	Input Text   Password      ${txtPASSWORD}
	Click Button    xpath:/s/html/body/div[2]/div/div/form/button
					

TC002 Open Calendar
    Click Element   xpath=(//span)[77]
    [Teardown]   Close BROWSER

*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}

