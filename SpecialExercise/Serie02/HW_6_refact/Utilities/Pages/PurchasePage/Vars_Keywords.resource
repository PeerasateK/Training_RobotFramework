*** Variables ***
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
