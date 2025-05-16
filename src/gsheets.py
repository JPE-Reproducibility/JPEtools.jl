import httplib2
import os

from apiclient import discovery
from google.oauth2 import service_account

try:
    # scopes = ["https://www.googleapis.com/auth/drive", "https://www.googleapis.com/auth/drive.file", "https://www.googleapis.com/auth/spreadsheets"]
    scopes = ["https://www.googleapis.com/auth/spreadsheets"]
    secret_file = os.environ['JPE_GOOGLE_KEY']

    spreadsheet_id = '1suU5e1Vc9LeVW9MgPFDsctZPSLKKwYn8pSf8LLMfNB8'
    range_name = 'new-arrivals!A2:Z100'

    credentials = service_account.Credentials.from_service_account_file(secret_file, scopes=scopes)
    service = discovery.build('sheets', 'v4', credentials=credentials)
    sheet = service.spreadsheets()

    result = (
        sheet.values()
        .get(spreadsheetId=spreadsheet_id,  range=range_name)
        .execute()
    )
    print(result)
    
    # values = [
    #     ['a1', 'b1', 'c1', 123],
    #     ['a2', 'b2', 'c2', 456],
    # ]

    # data = {
    #     'values' : values 
    # }

    # service.spreadsheets().values().update(spreadsheetId=spreadsheet_id, body=data, range=range_name, valueInputOption='USER_ENTERED').execute()



except OSError as e:
    print(e)