*** Variables ***
# Navigation Bar
${Nav_Brand_btn}        //*[contains(@href,'/shopbybrand')]
${Brand_btn}            //*[@id='แบรนด์ทั้งหมด' or @id='ALL BRANDS']//*[.='{BRAND}']
${Logo_brand_ele}       //*[@class="cmp-image__image" and contains(@src,'{BRAND}')]
