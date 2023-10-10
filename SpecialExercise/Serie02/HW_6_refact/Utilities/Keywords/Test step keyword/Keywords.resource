*** Settings ***
Resource    ../../../Configs/Common.resource


*** Keywords ***
Add all products to cart
    FOR    ${input}    IN    @{Data_Files.input_data.input_products}
        Go to products page    ${input.brand}
        Add ${input.products} to cart
    END

Go to CENTRAL to Shopping
    ${HOME}    Get Environment Variable    HOME
    Set Suite Variable    ${HOME}
    Open Browser    ${URL}    ${BROWSER}
    ...    options=binary_location="${HOME}${CHROME_PATH}"${CHROME_OPTIONS}${DISABLE_LOCATION}
    ...    executable_path=${HOME}${CHROME_DRIVER_PATH}
    Maximize Browser Window
    Run Keyword And Ignore Error    Click Element    ${Ads_Close_btn}

Go to products page
    [Arguments]    ${brand}
    ${Brand_btn}    Format String    ${Brand_btn}    BRAND=${brand.name}
    ${Logo_brand_ele}    Format String    ${Logo_brand_ele}    BRAND=${brand.logoBrand}
    Wait Until Element Is Visble and Mouse Over    ${Nav_Brand_btn}
    Wait Until Element Is Visble and Click    ${Brand_btn}
    Wait Until Element Is Visible    ${Logo_brand_ele}

Add ${products} to cart
    FOR    ${product}    IN    @{products}
        FOR    ${index}    IN RANGE    ${product.quantity}
            ${local_Card_ele}    Format String    ${Card_ele}    ProductID=${product.id}
            Scroll Element Into View Center    ${local_Card_ele}
            Mouse Over    ${local_Card_ele}
            Run Keyword    Click Add to Cart ${product['method']}    ${product.id}    ${product.size}
            Set Test Variable    ${expectedProductQty}    ${expectedProductQty+1}
            Wait Until Element Contains    ${Cart_Count_ele}    ${expectedProductQty}
        END
    END

View products in cart
    Click Element    ${View_Cart_btn}
    Check Loading Done

Verify that products in shopping cart is correct
    [Arguments]    ${products_in_cart}=${Data_Files.expected_data.products_in_cart}
    # Capture Element Screenshot    ${Shopping_Bag_ele}    ${OUTPUT DIR}/testData/shopping_cart.png
    ${Verify_checkout_balance}    Format String    ${Bag_Grand_Total_ele}    balance=${products_in_cart.checkout_balance}
    FOR  ${product}  IN  @{products_in_cart.products}
        Run Keyword    Verify all element product card in cart ${product.type}    ${product}
    END
    Element Should Be Visible    ${Verify_checkout_balance}

Checkout products in cart
    Click Element    ${Checkout_btn}
    Check Loading Done
    Wait Until Element Is Visble and Click    ${Guess_Mode_btn}
    Check Loading Done

Add delivery address
    [Arguments]    ${addressData}=${Data_Files.input_data.input_payment.addressInfo}
    Click Element    ${New_Shipping_Address_btn}
    Wait Until Element Is Visble and Click    ${Add_Shipping_Address_btn}
    Wait Until Element Is Visble and Fill Input Text    ${First_Name_inp}    ${addressData.firstName}
    Input Text    ${Last_Name_inp}    ${addressData.lastName}
    Input Text    ${Phone_inp}    ${addressData.phone}
    Input Text    ${Email_inp}    ${addressData.email}
    Scroll Element Into View Start    ${Address_inp}
    Input Text    ${Address_inp}    ${addressData.address}
    Input Text    ${PostCode_inp}    ${addressData.postCode}
    Check Loading Done
    Wait Until Element Is Visble and Select From List By Value    ${Province_sel}    ${addressData.province}
    Select From List By Value    ${District_sel}    ${addressData.district}
    Select From List By Value    ${SubDistrict_sel}    ${addressData.subDistrict}
    Scroll Element Into View Start    ${Address_Label_inp}
    Input Text    ${Address_Label_inp}    ${addressData.label}
    Click Element    ${Submit_Shiping_Address_btn}
    Check Loading Done
    Wait Until Click Succeed    ${Use_This_Address_btn}

Select shipping method : home
    Wait Until Element Is Visble and Click    ${Shipping_Method_1_1_rad}

Add Credit Card
    [Arguments]    ${creditCardData}=${Data_Files.input_data.input_payment.CreditInfo}
    Scroll Element Into View Center    ${Credit_Payment_rad}
    Click Element    ${Credit_Payment_rad}
    Input Text    ${Card_Fullname_inp}    ${creditCardData.fullName}
    Input Special Text    ${Card_Number_inp}    ${creditCardData.cardNumber}
    Input Special Text    ${Card_Expire_inp}    ${creditCardData.expired}
    Input Text    ${Card_Cvv_inp}    ${creditCardData.cvv}