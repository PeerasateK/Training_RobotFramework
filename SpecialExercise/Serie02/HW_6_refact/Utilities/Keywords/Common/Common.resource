*** Settings ***
Resource    ../../../Configs/Common.resource


*** Keywords ***
Load Data Files YAML
    ${data_files}    Set Variable    ${${TEST NAME}}
    Set Test Variable    ${data_files}    

Input Special Text
    [Arguments]    ${locator}    ${text}    ${clear}=${True}
    IF    ${clear}==${True}    Clear Element Text    ${locator}
    ${listTest}    Convert To List    ${text}
    FOR    ${char}    IN    @{listTest}
        Input Text    ${locator}    ${char}    ${False}
    END

Scroll Element Into View Center
    [Arguments]    ${locator}
    Execute Javascript    window.document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({behavior: "instant",block: "center"});
    Sleep    1s

Scroll Element Into View Start
    [Arguments]    ${locator}
    Execute Javascript    window.document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({behavior: "instant",block: "start"});
    Sleep    1s

Check Loading Done
    Wait Until Page Contains Element    ${Page_Loader_ele}
    Wait Until Page Contains Element    ${Page_Loader_Dnone_ele}
    Sleep    1s

Wait Until Element Is Visble and Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait Until Click Succeed
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Element Is Visble and Click    ${locator}

Wait Until Element Is Visble and Fill Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}

Wait Until Element Is Visble and Select From List By Value
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}
    Select From List By Value    ${locator}    ${value}

Wait Until Element Is Visble and Mouse Over
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Mouse Over    ${locator}
