*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  1
${txtUSER}		  Thongchaij
${txtPASSWORD}    testtest
${LOGIN URL}      https://www.iconext.cc/TaaTraining/EmployeeProfile
${Course}         Test002--Fang 

*** Test Cases ***
TC001 Valid Login
	Open Browser To Login Page
	Input Text   Username      ${txtUSER}
	Input Text   Password      ${txtPASSWORD}
	Click Button    //button[@class="btn btn-success btn-block"]

TC002 Open Menu Training Calendar
    Open Training Calendar

TC003 Search Course
    Search Course Training

TC004 Register Course
    Click Element    //*[@id="registerForm"]/button
    Click Element    //button[@class="swal2-confirm swal2-styled"]
    [Teardown]   Close BROWSER

*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}
Open Training Calendar
    Click Element     //*[@id="navbarColor01"]/ul/li[2]/a
Search Course Training
    Click Element    //*[@id="searchCourse"]
    Input Text    searchCourse    ${Course}
    Mouse Down    //*[@id="training-course"]/div[3]/div[2]/div/div/span[1]
    Click Element    //*[@id="DataTables_Table_1"]/tbody/tr/td[3]/div/a/span