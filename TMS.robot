*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  0
${txtUSER}		  vdriconext
${txtPASSWORD}    vdriconext
${LOGIN URL}      https://www.iconext.cc/TaaTrainingAdmin/Account/Login/?ReturnUrl=%2FTaaTrainingAdmin
${Course Name}    AutoTest001
${Course Category}    (//ins[@class="iCheck-helper"])[2]
${Included Certificate}    (//ins[@class="iCheck-helper"])[3]
${Online Course}     /html/body/div[4]/div/div[2]/div[2]/div/div/form/div/div[5]/div/div/label/div/ins
${Group course}     //*[@id="select2-CourseGroupId-container"]
${Text1}    Auto Test 001

*** Test Cases ***
TC001 Valid Login
	Open Browser To Login Page
	Input Text   Username      ${txtUSER}
	Input Text   Password      ${txtPASSWORD}
	Click Button    //button[@class="btn btn-primary block full-width m-b"]

TC002 Create Course
	Click Element     (//a[@href="/TaaTrainingAdmin/Course"])[2]
	Click Element     //a[@href="/TaaTrainingAdmin/Course/Add"]
	
TC003 Enter Course Name And Choose Category
	Input Text   CourseName   ${course name}
	Click Element   ${Course Category}

TC004 Check Certificate
	Click Element   ${Included Certificate}
	Click Element   //*[@id="select2-CertificatePrefixId-container"]
	Select From List By Value    //select[@name="CertificatePrefixId"]    1

Tc005 Check Online Course And Group course
	Click Element    (//ins[@class="iCheck-helper"])[4]
	Click Element    //*[@id="select2-CourseGroupId-container"]
	Select From List By Value    //select[@name="CourseGroupId"]    G129C0
	
TC006 Choose Organizer Division
	Click Element   //ul[@class="select2-selection__rendered"]
	Select From List By Value    //select[@name="OrganizerDivisionIds"]    9
	Click Element   //ul[@class="select2-selection__rendered"]
	Select From List By Value    //select[@name="OrganizerDivisionIds"]    25

TC007 Input Course Outline
	Input Text    //div[@class="note-editable"]    ${Text1}
	
TC008 Save Course
	Save Course
	Page Should Contain    AutoTest001
		
*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}

Save Course
	Click Button     //button[@class="btn btn-success btn-w-m left-15 btn-lg btn-save"]