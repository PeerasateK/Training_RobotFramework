*** Settings ***
Resource    ../../../Configs/Common.resource


*** Variables ***
# Cart
${expectedProductQty}               ${0}
${Cart_Count_ele}                   //*[contains(@class,'cartCountInHeader')]
${View_Cart_btn}                    //*[@data-testid='btn-viewCart-bag']
${Shopping_Bag_ele}                 //*[@id='shoppingBag']
${Checkout_btn}                     //*[@data-testid='btn-saveCart-checkout']
${Guess_Mode_btn}                   //*[contains(@class,'spc-log-in__button-message')]/..
# Verify Products
${Verify_text_product_cart}         //*[@id='{ProductID}']//*[normalize-space(.)='{text}']
${Verify_size_product_cart}         //*[@id='{ProductID}']//*[contains(text(),'{size}')]
${Verify_quantity_product_cart}     //*[@data-testid='btn-removeCart-decrement{ProductID}']/following-sibling::span[text()='{quantity}']
${Bag_Grand_Total_ele}              //*[@id='spcBagGrandTotal' and text()='{balance}']


*** Keywords ***
# Verify cart
Verify all element product card in cart General
    [Arguments]    ${product}
    ${Verify_brand}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.brand}
    ${Verify_describe}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.describe}
    ${Verify_quantity}    Format String    ${Verify_quantity_product_cart}    ProductID=${product.id}    quantity=${product.quantity}
    ${Verify_card_price}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.card_price}
    Scroll Element Into View Center    ${Verify_brand}
    Element Should Be Visible    ${Verify_brand}
    Element Should Be Visible    ${Verify_describe}
    Element Should Be Visible    ${Verify_quantity}
    Element Should Be Visible    ${Verify_card_price}

Verify all element product card in cart with size
    [Arguments]    ${product}
    ${Verify_brand}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.brand}
    ${Verify_describe}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.describe}
    ${Verify_size}    Format String    ${Verify_size_product_cart}    ProductID=${product.id}    size=${product.size}
    ${Verify_quantity}    Format String    ${Verify_quantity_product_cart}    ProductID=${product.id}    quantity=${product.quantity}
    ${Verify_card_price}    Format String    ${Verify_text_product_cart}    ProductID=${product.id}    text=${product.card_price}
    Scroll Element Into View Center    ${Verify_brand}
    Element Should Be Visible    ${Verify_brand}
    Element Should Be Visible    ${Verify_describe}
    Element Should Be Visible    ${Verify_size}
    Element Should Be Visible    ${Verify_quantity}
    Element Should Be Visible    ${Verify_card_price}
