*** Settings ***
Library    AppiumLibrary

*** Variables ***
${platform_name}      Android
${platform_version}   10
${device_name}        Redmi Note 7
${udid}               e961cc59
${port}               4723
${REMOTE_URL}         http://localhost:${port}
${app_package}        com.miui.calculator
${app_activity}       cal.CalculatorActivity
${automation_name}    UiAutomator2

${btn_5}              id=com.miui.calculator:id/btn_5_s
${btn_3}              id=com.miui.calculator:id/btn_3_s
${btn_plus}           id=com.miui.calculator:id/btn_plus_s
${btn_equal}          id=com.miui.calculator:id/btn_equal_s
${txt_result}         id=com.miui.calculator:id/result

*** Keywords ***
Open Test App
    Open Application    ${REMOTE_URL}
    ...    automationName=${automation_name}
    ...    platformName=${platform_name}
    ...    platformVersion=${platform_version}
    ...    deviceName=${device_name}
    ...    udid=${udid}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}

Close Test App
    Close Application

*** Test Cases ***
Test Add Two Numbers
    Open Test App
    Click Element    ${btn_5}
    Click Element    ${btn_plus}
    Click Element    ${btn_3}
    Click Element    ${btn_equal}
    ${text}=    Get Text    ${txt_result}
    Log To Console    Kết quả: ${text}
    Close Test App
