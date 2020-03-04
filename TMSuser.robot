*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  1
${txtUSER}		  vdriconext
${txtPASSWORD}    vdriconext
${LOGIN URL}      https://www.iconext.cc/TaaTraining/EmployeeProfile
${SearchCourse}     Test Create New Course -- 001

*** Test Cases ***
TC001 Valid Login
	Open Browser To Login Page
	Input Text   Username      ${txtUSER}
	Input Text   Password      ${txtPASSWORD}
	Click Button    //button[@class="btn btn-success btn-block"]

TC002 Chick Training Calendar
	Click Element    //*[@id="navbarColor01"]/ul/li[2]/a
	Click Element    searchCourse
	Input Text   searchCourse      ${SearchCourse}
	Click Element   
	[Teardown]   Close BROWSER

*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}

