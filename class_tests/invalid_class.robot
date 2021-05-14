*** Settings ***
Documentation     A test suite containing tests related to Missing Input.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To createClass
Suite Teardown    Close Browser
Test Setup        Go To createClass Page
Test Template     createClass With Missing Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               Title        Description	Difficulty		Language
Missing Title                 	 ${EMPTY}     whatever   	Beginner		Cantonese
Missing Description            	 whatever     ${EMPTY}   	Beginner		Cantonese
Missing Difficulty               whatever     whatever   	Please select	Cantonese
Missing Language              	 whatever     whatever   	Beginner		Please select 			

*** Keywords ***
createClass With Missing Credentials Should Fail
    [Arguments]    ${title}    ${description}	${Difficulty}	${Language}
    Input Title    ${title}
    Input Description    ${description}
	Input Difficulty	${Difficulty}
	Input Language	${Language}
    Submit Credentials
    createClass Should Have Failed

createClass Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
