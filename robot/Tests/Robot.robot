*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary

*** Variables ***
${time_out}        10
${url_demoblaze}   https://www.demoblaze.com    # Sửa http thành https để tránh lỗi redirect
${login_btn}       id=login2    # Sửa locator thành id để ổn định hơn
${login_title}     xpath=//h5[normalize-space()='Log in']
${username_field}  id=loginusername
${password_field}  id=loginpassword
${login_submit}    xpath=//button[normalize-space()='Log in']
${welcome_admin}   id=nameofuser    # Locator chính xác cho welcome text

*** Keywords ***
Login_kw
    [Arguments]    ${username_data}    ${password_data}
    Wait Until Element Is Visible    ${login_btn}    ${time_out}
    Execute Javascript    document.getElementById('login2').click()    # Sửa click bằng JS để tránh overlap carousel
    Wait Until Element Is Visible    ${login_title}    ${time_out}
    Input Text    ${username_field}    ${username_data}
    Input Password    ${password_field}    ${password_data}    # Sửa thành Input Password để bảo mật
    Click Button    ${login_submit}

*** Test Cases ***
Login_success
    Open Browser    ${url_demoblaze}    chrome    options=add_argument("--window-size=1920,1080");add_argument("--disable-gpu");add_argument("--no-sandbox")    # Thêm options để fix kích thước và CI issues
    Maximize Browser Window
    Login_kw    admin    admin
    Wait Until Element Contains    ${welcome_admin}    Welcome admin    ${time_out}
    Close Browser

Login_fail
    Open Browser    ${url_demoblaze}    chrome    options=add_argument("--window-size=1920,1080");add_argument("--disable-gpu");add_argument("--no-sandbox")
    Maximize Browser Window
    Login_kw    admin    admi
    Handle Alert    action=ACCEPT    # Xử lý alert lỗi login nếu có
    Close Browser