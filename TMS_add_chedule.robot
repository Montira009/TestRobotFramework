*** Setting ***
Library         Selenium2Library

*** Variables ***
${BROWSER}    	  gc
${DELEY}    	  0
${txtUSER}		  vdriconext
${txtPASSWORD}    vdriconext
${LOGIN URL}      https://www.iconext.cc/TaaTrainingAdmin/Account/Login/?ReturnUrl=%2FTaaTrainingAdmin
${Course Name}    AutoTest003
${Course Category}    (//ins[@class="iCheck-helper"])[2]
${Included Certificate}    (//ins[@class="iCheck-helper"])[3]
${Online Course}     /html/body/div[4]/div/div[2]/div[2]/div/div/form/div/div[5]/div/div/label/div/ins
${Group course}     //*[@id="select2-CourseGroupId-container"]
${Text1}    Auto Test 003
${Start}    xpath://html/body/div[5]/div[1]/table/tbody/tr[4]/td[6]
${End}      xpath://html/body/div[5]/div[1]/table/tbody/tr[4]/td[7]
${Training Duration}    2 days
${Training Hour}     16:00
${Registration Date}    xpath://html/body/div[5]/div[1]/table/tbody/tr[3]/td[5]
${Registration Close Date}    xpath://html/body/div[5]/div[1]/table/tbody/tr[4]/td[5]
${Text2}    Engineering


*** Test Cases ***
TC001 Valid Login
	Open Browser To Login Page
	Input Text   Username      ${txtUSER}
	Input Text   Password      ${txtPASSWORD}
	Click Button    //button[@class="btn btn-primary block full-width m-b"]

TC002 Create Course
	Click Element     (//a[@href="/TaaTrainingAdmin/Course"])
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
	Page Should Contain    AutoTest

TC009 Create Training Schedule
	Mouse Down    xpath://html/body/div[4]/div/div[3]/div/a
	Click Element     xpath://html/body/div[4]/div/div[3]/div/a

TC010 Training Start-End Date
	Click Element    //*[@id="TrainingDateFrom"]
	Click Element    ${Start}
	Click Element    //*[@id="TrainingDateTo"]
	Click Element    ${End}

TC011 TrainingDuration And Hour
	Click Element    //*[@id="TrainingDuration"]
	Input Text   TrainingDuration    ${Training Duration}
	Click Element    //*[@id="inputmask-time"]
	Input Text   inputmask-time   ${Training Hour}

TC012 Station Until Registration Type
	Click Element   select2-TrainingStationId-container
	Select From List By Value    //select[@name="TrainingStationId"]    19
	Click Element  TrainingLocation
	Input Text   TrainingLocation   A123
	Input Text   ParticipantCapacity   30
	#--Select Radio Button   //select[@id="CategoryId"]   1
	Click Element   (//ins[@class="iCheck-helper"])[1]

TC013 Registration Date Until Close
	Click Element   //*[@id="RegistrationDateFrom"]
	Click Element   ${Registration Date}
	Click Element   //*[@id="RegistrationDateTo"]
	Click Element   ${Registration Close Date}
	Click Element   //*[@id="TrainingScheduleAudienceDivisionId"]
	Select From List By Value    //select[@name="TrainingScheduleAudienceDivisionId"]    9
	Click Element   //*[@id="TrainingScheduleAudienceDivisionId"]
	Select From List By Value    //select[@name="TrainingScheduleAudienceDivisionId"]    25
	[Teardown]   Close BROWSER

	
*** Keywords ***
Open Browser To Login Page
	Open Browser   ${LOGIN URL}    ${BROWSER}
	Maximize Browser Window
	Set Selenium Speed   ${DELEY}

Save Course
	Click Button     //button[@class="btn btn-success btn-w-m left-15 btn-lg btn-save"]