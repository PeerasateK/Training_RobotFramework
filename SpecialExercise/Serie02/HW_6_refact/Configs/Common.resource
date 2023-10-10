*** Settings ***
Library         SeleniumLibrary    timeout=10s
Library         OperatingSystem
Library         String
Library         Collections
Resource        ../Utilities/Pages/Common/Variables.resource
Resource        ../Utilities/Pages/HomePage/Vars_Keywords.resource
Resource        ../Utilities/Pages/ProductPage/Vars_Keywords.resource
Resource        ../Utilities/Pages/CartPage/Vars_Keywords.resource
Resource        ../Utilities/Pages/PurchasePage/Vars_Keywords.resource
Resource        ../Utilities/Keywords/Common/Common.resource
Resource        ../Utilities/Keywords/Test step keyword/Keywords.resource
Variables       ../Utilities/Test_Data/Data_files_${Language}.yaml
Variables       ../Utilities/Test_Data/prefs.yaml



*** Variables ***
# Browser
${URL}                      https://www.central.co.th/en/
${BROWSER}                  Chrome
${CHROME_PATH}              /Documents/chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing
${CHROME_DRIVER_PATH}       /Documents/chrome/chromedriver
${CHROME_OPTIONS}           ;add_experimental_option("detach", ${True});add_argument("--disable-notifications");add_argument("--disable-notifications")
${DISABLE_LOCATION}         ;add_experimental_option("prefs",${prefsyaml})

${Language}                 en
