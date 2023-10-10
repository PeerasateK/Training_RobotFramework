*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    Common.resource


*** Keywords ***
Go to CENTRAL to Shopping
    ${HOME}    Get Environment Variable    HOME
    Set Suite Variable    ${HOME}
    Open Browser    ${URL}    ${BROWSER}
    ...    options=binary_location="${HOME}${CHROME_PATH}"${CHROME_OPTIONS}${DISABLE_LOCATION}
    ...    executable_path=${HOME}${CHROME_DRIVER_PATH}
    Maximize Browser Window

Go to "${brand}" products page
    Mouse Over    ${Nav_Brand_btn}
    Wait Until Element Is Visible    ${SubMenu_Layout}    5s
    Click Element    ${Brand_btn.replace('BRAND','${brand}')}
    Wait Until Element Is Visible    ${Logo_brand_ele.replace('BRAND','${brand.replace(' ','-').lower()}')}    10s

Add ${products} to cart
    FOR    ${product}    IN    @{products}
        ${productID}    Set Variable    ${product['id']}
        ${productSize}    Set Variable    ${product['size']}
        ${productCard}    Set Variable    ${Card_ele.replace('ProductID','${product['id']}')}
        ${Add_To_Cart_By_ProductID_btn}    Set Variable    ${Add_To_Cart_btn.replace('ProductID','${productID}')}
        ${Add_To_Cart_Select_Size_By_ProductID_btn}    Set Variable    ${Add_To_Cart_Select_Size_btn.replace('ProductID','${productID}')}
        ${Add_To_Cart_Size_By_ProductID_btn}    Set Variable    ${Add_To_Cart_Size_btn.replace('ProductID','${productID}')}

        Run Keyword And Ignore Error    Scroll Element Into View    ${productCard}
        Sleep    1s    # stuck for long long time mouse over cant use in the first time
        Mouse Over    ${productCard}
        ${expectedProductsAmount}    Set Variable    ${1}
        ${productsCount}    Get Text    ${Cart_Count_ele}
        IF    '${productsCount}'!=''
            ${expectedProductsAmount}    Evaluate    ${productsCount}+1
        END
        ${IsAddCartVisible}    Run Keyword And Ignore Error    Element Should Be Visible    ${Add_To_Cart_By_ProductID_btn}
        ${IsAddCartWithSizeVisible}    Run Keyword And Ignore Error    Element Should Be Visible    ${Add_To_Cart_Select_Size_By_ProductID_btn}
        Log To Console    ${IsAddCartVisible[0]}||${IsAddCartWithSizeVisible[0]}
        IF    '${IsAddCartVisible[0]}'=='PASS'
            Run Keyword And Ignore Error    Scroll Element Into View    ${Add_To_Cart_By_ProductID_btn}
            Sleep    0.5s
            Click Element    ${Add_To_Cart_By_ProductID_btn}
        ELSE IF    '${IsAddCartWithSizeVisible[0]}'=='PASS'
            Run Keyword And Ignore Error    Scroll Element Into View    ${Add_To_Cart_Select_Size_By_ProductID_btn}
            Sleep    0.5s
            Click Element    ${Add_To_Cart_Select_Size_By_ProductID_btn}
            Sleep    0.5s
            Click Element    ${Size_Arrow_Down_btn}
            Click Element    ${Size_btn.replace('SIZE','${productSize}')}
            Click Element    ${Add_To_Cart_Size_By_ProductID_btn}
        ELSE
            Run Keyword And Ignore Error    Fail
        END
        Wait Until Element Contains    ${Cart_Count_ele}    ${expectedProductsAmount}    5s
    END

Capture Shopping Cart
    Click Element    ${View_Cart_btn}
    Wait Until Page Does Not Contain Element    ${Page_Loader_ele}    10s
    Capture Element Screenshot    ${Shopping_Bag_ele}    ${OUTPUT DIR}/testData/shopping_cart.png