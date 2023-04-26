*** Settings ***
Library  OperatingSystem
Library  RequestsLibrary
Library  Collections
Library  ../common/api.py
Library  JSONLibrary
*** Variables ***
${base_url}      https://sampleproject.ingest.mpdev.io/
${response_code}
${response_body}

*** Keywords ***
Execute API
    [Arguments]     ${data}
    ${file}     load json from file     ../common/data.json
    create session  AddData   ${base_url}
    ${payload}=      get value from json    ${file}    $.${data}
    ${body}=    evaluate    json.dumps(${payload}).replace('[','').replace(']','')
    ${header}=      create dictionary   Content-Type=application/json
    ${response}=    post request  AddData   /v1/track   data=${body}    headers=${header}
    set suite variable  ${response_code}     ${response.status_code}
    set suite variable  ${response_body}     ${response.content}

Validation
    [Arguments]     ${expected_status_code}     ${expected_body}
    run keyword and continue on failure    should be equal as integers     ${response_code}     ${expected_status_code}   msg=Failed, Actual status code: ${response_code} - Expected status code: ${expected_status_code}       values=False
    run keyword and continue on failure    should be equal as strings      ${response_body}     ${expected_body}        msg=Failed, Actual body: ${response_body} - Expected body: ${expected_body}       values=False