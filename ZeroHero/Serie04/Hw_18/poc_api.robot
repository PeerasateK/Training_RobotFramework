*** Settings ***
Library     RequestsLibrary


*** Test Cases ***
Get Pet By ID
    ${response}=    GET    https://petstore3.swagger.io/api/v3/pet/55    expected_status=any
    Log    ${response}
    Status Should Be    404    ${response}
    Should Be Equal As Strings    Not Found    ${response.reason}

Create Pet
    ${body}=    Evaluate
    ...    json.loads('{"id":55,"name":"aaa","category":{"id":1,"name":"Ants"},"photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}')
    ${response}=    POST    https://petstore3.swagger.io/api/v3/pet    json=${body}
    Status Should Be    200    ${response}
    Should Be Equal As Strings    OK    ${response.reason}
    ${expectedData}    Evaluate    json.loads('{"id":55,"name":"aaa","category":{"id":1,"name":"Ants"},"photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}')

    # Should Be Equal As Strings    ${response.json()}   ${expectedData} 

Edit Pet
    ${body}=    Evaluate
    ...    json.loads('{"id":55,"name":"aaa","category":{"id":1,"name":"Slot"},"photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}')
    ${response}=    PUT    https://petstore3.swagger.io/api/v3/pet    json=${body}

Remove Pet
    ${response}=    DELETE    https://petstore3.swagger.io/api/v3/pet/55
    Log    ${response}
    Status Should Be    200    ${response}
    Should Be Equal As Strings    OK    ${response.reason}

    Should Be Equal As Strings    ${response.content}   Pet deleted
