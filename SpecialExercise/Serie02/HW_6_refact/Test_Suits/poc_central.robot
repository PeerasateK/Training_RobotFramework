*** Settings ***
Resource        ../Configs/Common.resource

Suite Setup     Go to CENTRAL to Shopping
Suite Teardown    Close Browser
Test Setup      Load Data Files YAML


*** Test Cases ***
TC-01_Shopping
    [Documentation]    add 2 products in to the cart
    Add all products to cart
    View products in cart
    Verify that products in shopping cart is correct
    Checkout products in cart
    Add delivery address
    Select shipping method : home
    Add credit card
    # Verify that delivery is correct
    # Verify that products in checkout is correct
    # Verify that bill is correct
