import requests
import json


class api(object):
    def api_run(self, test_case_number):
        with open('../common/data.json') as f:
            payload = json.load(f)

        item_values = payload[test_case_number]

        url = 'https://sampleproject.ingest.mpdev.io/v1/track'
        response = requests.post(url, json=item_values)
        # Assert the response
        expected_error_code_200 = 200
        expected_error_code_400 = 400
        expected_response_200 = {"result": "ok"}
        expected_response_400 = {'message': 'Invalid request body'}
        if response.status_code == 200:
            if response.json() == expected_response_200:
                print("Test case passed.")
                print("Status code: " + str(response.status_code))
                print("Body: " + str(response.json()))
            else:
                raise ValueError(
                    "Expected response body: " + str(expected_response_200) + ", but got: " + str(response.json()))
        elif response.status_code == 400:
            if response.json() == expected_response_400:
                print("Test case passed.")
                print("Status code: " + str(response.status_code))
                print("Body: " + str(response.json()))
            else:
                raise ValueError(
                    "Expected response body: " + str(expected_response_400) + ", but got: " + str(response.json()))
        else:
            error_message = "Expected Error code: " + str(expected_error_code_200) + " or " + str(
                expected_error_code_400) + " -- Actual Error code: " + str(response.status_code) + "\n"
            error_message += "Expected response body: " + str(expected_response_200) + " or " + str(
                expected_response_400) + " -- Actual response body: " + str(response.json())
            raise ValueError(error_message)
