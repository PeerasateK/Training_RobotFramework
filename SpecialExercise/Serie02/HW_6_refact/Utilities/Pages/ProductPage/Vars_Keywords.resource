*** Settings ***
Resource    ../../../Configs/Common.resource


*** Variables ***
# Product
${Card_ele}                         //*[contains(@data-testid,'{ProductID}')]//ancestor::*[contains(@class,'productCard')]
${Add_To_Cart_btn}                  //button[contains(@data-testid,'{ProductID}')]
${Add_To_Cart_Select_Size_btn}      //*[contains(@data-testid,'{ProductID}')]//following-sibling::*[contains(@class,'optionLayout')]//*[@class='quickBuy']
${Size_Arrow_Down_btn}              //div[@class='sliderItem productCard active']//*[contains(@class,'arrow-down')]
${Size_btn}                         //div[@class='sliderItem productCard active']//li[@data-value='{SIZE}']
${Add_To_Cart_Size_btn}             //*[@data-testid='btn-addCart-searchResult{ProductID}']


*** Keywords ***
Click Add to Cart
    [Arguments]    ${ID}    ${Size}=${EMPTY}
    ${Add_To_Cart_btn}    Format String    ${Add_To_Cart_btn}    ProductID=${ID}
    Wait Until Element Is Visble and Click    ${Add_To_Cart_btn}

Click Add to Cart Select Size
    [Arguments]    ${ID}    ${Size}
    ${Add_To_Cart_Select_Size_btn}    Format String    ${Add_To_Cart_Select_Size_btn}    ProductID=${ID}
    ${Size_btn}    Format String    ${Size_btn}    SIZE=${Size}
    ${Add_To_Cart_Size_btn}    Format String    ${Add_To_Cart_Size_btn}    ProductID=${ID}
    Wait Until Element Is Visble and Click    ${Add_To_Cart_Select_Size_btn}
    Sleep    0.5s
    Click Element    ${Size_Arrow_Down_btn}
    Click Element    ${Size_btn}
    Click Element    ${Add_To_Cart_Size_btn}
