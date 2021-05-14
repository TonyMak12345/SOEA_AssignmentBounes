*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Safari
${DELAY}          0
${VALID TITLE}     A
${VALID DESCRIPTION}    A
${CLASS URL}      http://${SERVER}/createClass.html
${CREATED URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
createClass Page Should Be Open
    Location Should Be    ${CLASS URL}
    Title Should Be   Create class
	
Classcreated Page Should Be Open
    Location Should Be    ${CREATED URL}
    Title Should Be    Result Page

Open Browser To createClass
    Open Browser    ${CLASS URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    createClass Page Should Be Open

Go To createClass Page
    Go To    ${CLASS URL}
    createClass Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Submit Credentials
    Click Button    submit_button

	
Input Difficulty
	[Arguments]    ${label}
	Select From List By Label	id:difficulty_field	${label}
	
Input Language
	[Arguments]    ${label1}
	Select From List By Label	id:language_field	${label1}
