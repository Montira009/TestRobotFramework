*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  1
${txtUSER}		  robot
${txtPASSWORD}    p@ssw0rd
${LOGIN URL}      http://192.168.99.49/RobotWorkshop/Home/Login
${name}     	  TestNO1
${welcome}		  //*[@id="msg"]/option[2]
${gender}		  //*[@id="form-welcome"]/div[2]/div/div[2]/label
${birthday}		  02/09/1996
${chocolate}	  //*[@id="form-welcome"]/div[4]/div/div[1]/label
${cake}	  		  //*[@id="form-welcome"]/div[4]/div/div[2]/label
${lollipop}	  	  //*[@id="form-welcome"]/div[4]/div/div[3]/label
${icecream}	  	  //*[@id="form-welcome"]/div[4]/div/div[4]/label

*** Test Cases ***
Tc001 Valid Login
	Open Browser To Login Page
	Input Text   username      ${txtUSER}
	Input Text   password      ${txtPASSWORD}
	Click Button    btn-login
	Page Should Contain  Welcome robot

TC002 Fill in data and save
	Click Element     menu-wm
	Page Should Contain    Welcome Message
	Drag And Drop Welcome Message
	Input Text   name   ${name}
	Get Selected List Label To Choose Gender
	Click Element   //*[@id="form-welcome"]/div[3]/img
	Input Text   birthDate   ${birthday}
	Click Element     //*[@id="ui-datepicker-div"]/table/tbody/tr[1]/td[2]/a
	Checkbox Should Be Selected Dessert
	Click Button    btn-set-msg
	Page Should Contain    Nice to meet you.

TC003 Logout
	Click Element    btn-logout
	Click Button     logout-submit
	Go To Home Page
	[Teardown]   Close BROWSER

*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}
	Title Should Be  Robot Framework 2014

Drag And Drop Welcome Message
    Click Element   //*[@id="msg"]
    Click Element   ${welcome}

Get Selected List Label To Choose Gender
	Click Element   ${gender}
	
Checkbox Should Be Selected Dessert
	Click Element   ${icecream}
	Click Element   ${cake}
	
Go To Home Page
	Go To    ${LOGIN URL}
