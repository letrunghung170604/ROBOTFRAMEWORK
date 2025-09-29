*** Settings ***
Library  SeleniumLibrary
Library  ScreenCapLibrary
*** Variables ***
${time_out}  10
${url_demoblaze}  http://demoblaze.com
${login_btn}  xpath=//a[@id='login2']
${login_title}  xpath=//h5[normalize-space()='Log in']
${username_field}  xpath=//input[@id='loginusername']
${password_field}  xpath=//input[@id='loginpassword']
${login_submit}  xpath=//button[normalize-space()='Log in']
${welcome_admin}  xpath=//a[normalize-space()='Welcome admin']
*** Keywords ***
Login_kw
    [Arguments]  ${username_data}  ${password_data}
    Click Element  ${login_btn}
    Wait Until Element Is Visible  ${login_title}  ${time_out}
    Input Text  ${username_field}  ${username_data}
    Input Text  ${password_field}  ${password_data}
    Click Element  ${login_submit}
*** Test Cases ***
Login_success
    Start Video Recording
    Open Browser  ${url_demoblaze}  chrome
    Wait Until Element Is Visible  ${login_btn}
    Login_kw  admin  admin
    Wait Until Element Contains  ${welcome_admin}  Welcome admin
    Stop Video Recording
Login_fail
    Open Browser  ${url_demoblaze}  chrome
    Wait Until Element Is Visible  ${login_btn}
    Login_kw  admin  admi
    Sleep  10

    
    