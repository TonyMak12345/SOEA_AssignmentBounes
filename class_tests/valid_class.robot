*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To createClass
    Input Title    a
    Input Description    a
	Input Difficulty 	Beginner
	Input Language		Cantonese
    Submit Credentials
    Classcreated Page Should Be Open
    [Teardown]    Close Browser
