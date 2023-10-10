*** Settings ***
Variables       prefs.yaml


*** Variables ***
# Browser
${URL}                              https://www.central.co.th/en/
${BROWSER}                          Chrome
${CHROME_PATH}                      /Documents/chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing
${CHROME_DRIVER_PATH}               /Documents/chrome/chromedriver
${CHROME_OPTIONS}                   ;add_experimental_option("detach", ${True});add_argument("--disable-notifications");add_argument("--disable-notifications")
${DISABLE_LOCATION}                 ;add_experimental_option("prefs",${prefsyaml})

# Cental
${Ads_Close_btn}                     //*[starts-with(@id,'close-button-')]

# Navigation Bar
${Nav_Brand_btn}                    //*[contains(@href,'/shopbybrand')]
${Brand_btn}                        //*[@id='แบรนด์ทั้งหมด' or @id='ALL BRANDS']//*[.='{BRAND}']
${Logo_brand_ele}                   //*[@class="cmp-image__image" and contains(@src,'{BRAND}')]

# Product
${Card_ele}                         //*[contains(@data-testid,'{ProductID}')]//ancestor::*[contains(@class,'productCard')]
${Add_To_Cart_btn}                  //button[contains(@data-testid,'{ProductID}')]
${Add_To_Cart_Select_Size_btn}      //*[contains(@data-testid,'{ProductID}')]//following-sibling::*[contains(@class,'optionLayout')]//*[@class='quickBuy']
${Size_Arrow_Down_btn}              //div[@class='sliderItem productCard active']//*[contains(@class,'arrow-down')]
${Size_btn}                         //div[@class='sliderItem productCard active']//li[@data-value='{SIZE}']
${Add_To_Cart_Size_btn}             //*[@data-testid='btn-addCart-searchResult{ProductID}']

# Cart
${expectedProductQty}               ${0}
${Cart_Count_ele}                   //*[contains(@class,'cartCountInHeader')]
${View_Cart_btn}                    //*[@data-testid='btn-viewCart-bag']
${Shopping_Bag_ele}                 //*[@id='shoppingBag']
${Checkout_btn}                     //*[@data-testid='btn-saveCart-checkout']
${Guess_Mode_btn}                   //*[contains(@class,'spc-log-in__button-message')]/..
#    Verify Products
${Verify_text_product_cart}         //*[@id='{ProductID}']//*[normalize-space(.)='{text}']
${Verify_size_product_cart}         //*[@id='{ProductID}']//*[contains(text(),'{size}')]
${Verify_quantity_product_cart}     //*[@data-testid='btn-removeCart-decrement{ProductID}']/following-sibling::span[text()='{quantity}']
${Bag_Grand_Total_ele}              //*[@id='spcBagGrandTotal' and text()='{balance}']

# Purchase
#    Shipping
${New_Shipping_Address_btn}         //*[contains(@class,'address-data-not-available')]/..
${Add_Shipping_Address_btn}         //*[@data-testid='lnk-ShippingAddress-AddNewAdr']
${First_Name_inp}                   //*[@data-testid='txt-formShippingAddress-firstNameTxtbx']
${Last_Name_inp}                    //*[@data-testid='txt-formShippingAddress-lastNameTxtbx']
${Phone_inp}                        //*[@data-testid='txt-formShippingAddress-phoneNoTxtbx']
${Email_inp}                        //*[@data-testid='txt-formShippingAddress-emailTxtbx']
${Address_inp}                      //*[@data-testid='txt-formShippingAddress-addressTxtbx']
${PostCode_inp}                     //*[@data-testid='txt-formShippingAddress-postcodeTxtbx']
${Province_sel}                     //*[@class='province select-field data-yes']/preceding-sibling::select
${District_sel}                     //*[@class='district select-field data-yes']/preceding-sibling::select
${SubDistrict_sel}                  //*[@class='subdistrict select-field data-yes']/preceding-sibling::select
${Address_Label_inp}                //*[@data-testid='txt-formShippingAddress-addressLabelTxtbx']
${Submit_Shiping_Address_btn}       //*[@data-testid='lnk-formShippingAddress-submitAddAddress']
${Use_This_Address_btn}             //*[@data-testid='btn-saveAddress-useThisAddress']
${Shipping_Method_1_1_rad}          //*[@id='spc-shipment-method_1_1']
#    Payment
${Credit_Payment_rad}               //*[@id='payment_service_fullpayment']
${Card_Fullname_inp}                //*[@id='cardName']
${Card_Number_inp}                  //*[@id='cardNumber']
${Card_Expire_inp}                  //*[@id='expiryDate']
${Card_Cvv_inp}                     //*[@id='cvvNumber']

# Common
${Page_Loader_ele}                  //*[@class='pageLoader']
${Page_Loader_Dnone_ele}            //*[@class='pageLoader d-none']

# Language
${Language}                         en
