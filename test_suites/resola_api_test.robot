*** Settings ***
Resource    ../common/keywords.robot

*** Variables ***
${base_url}      https://sampleproject.ingest.mpdev.io/

*** Test Cases ***
TC Track Event with valid input
    Execute API  valid_input
    validation      200     {"result":"ok"}

TC Missing required `organizationId` field
    Execute API  missing_organizationId
    validation      400     {"message": "Invalid request body"}

TC Missing required `projectId` field
    Execute API  missing_projectId
    validation      400     {"message": "Invalid request body"}

TC Missing required `requestId` field
    Execute API  missing_requestId
    validation      400     {"message": "Invalid request body"}

TC Missing required `category` field
    Execute API  missing_category
    validation      400     {"message": "Invalid request body"}

TC Missing required `event` field
    Execute API  missing_event
    validation      400     {"message": "Invalid request body"}

TC Missing required `context` field
    Execute API  missing_context
    validation      400     {"message": "Invalid request body"}

TC Missing required `properties` field
    Execute API  missing_properties
    validation      400     {"message": "Invalid request body"}

TC Missing required `sentAt` field
    Execute API  missing_sentAt
    validation      400     {"message": "Invalid request body"}

TC Invalid value for `deviceType` field
    Execute API  wrong_devicetype
    validation      400     {"message": "Invalid request body"}

TC Invalid data type
    Execute API  invalid_data_type_userId
    validation      400     {"message": "Invalid request body"}