# Week 5 — DynamoDB and Serverless Caching

## Required Tasks

### Videos

I watched the following videos to prepare myself for week 5 of the cloud project bootcamp -

1. Week 5 live stream - Setup Data Model
2. Amazon DynamoDB Security Best Practices by Ashish
3. DynamoDB utility scripts
4. Implementing conversations
5. DynamoDB streams

---

### Create Bash scripts to create schema, seed and scan the database

- Add `boto3` to the requirements.txt file and run `pip install`.
- Create a new folder `ddb` inside `backend-flask/bin` .
- Add `schema-load` script to this folder and make it executable
- Run script `./bin/ddb/schema-load`
- Ouput

```bash
❯ ./bin/ddb/schema-load
{'TableDescription': {'AttributeDefinitions': [{'AttributeName': 'pk', 'AttributeType': 'S'}, {'AttributeName': 'sk', 'AttributeType': 'S'}], 'TableName': 'cruddur-message', 'KeySchema': [{'AttributeName': 'pk', 'KeyType': 'HASH'}, {'AttributeName': 'sk', 'KeyType': 'RANGE'}], 'TableStatus': 'ACTIVE', 'CreationDateTime': datetime.datetime(2023, 3, 22, 10, 45, 31, 776000, tzinfo=tzlocal()), 'ProvisionedThroughput': {'LastIncreaseDateTime': datetime.datetime(1970, 1, 1, 5, 30, tzinfo=tzlocal()), 'LastDecreaseDateTime': datetime.datetime(1970, 1, 1, 5, 30, tzinfo=tzlocal()), 'NumberOfDecreasesToday': 0, 'ReadCapacityUnits': 5, 'WriteCapacityUnits': 5}, 'TableSizeBytes': 0, 'ItemCount': 0, 'TableArn': 'arn:aws:dynamodb:ddblocal:000000000000:table/cruddur-message'}, 'ResponseMetadata': {'RequestId': 'c92b6b70-b2b5-480c-974c-01525a3a7d7b', 'HTTPStatusCode': 200, 'HTTPHeaders': {'date': 'Wed, 22 Mar 2023 05:15:31 GMT', 'x-amzn-requestid': 'c92b6b70-b2b5-480c-974c-01525a3a7d7b', 'content-type': 'application/x-amz-json-1.0', 'x-amz-crc32': '2239767864', 'content-length': '578', 'server': 'Jetty(9.4.48.v20220622)'}, 'RetryAttempts': 0}}
```

- Create [`backend-flask/bin/ddb/seed`](media/week5/code/ddb-seed) and make it executable.

- Update the PostgreSQL database schema and seed the data.
- Run `./bin/ddb/seed` to seed the DynamoDB database.
- This method might not be the most efficient way to do this. Sometimes, it's much more efficient to use `BatchWriteItem`.


- Used to list all data in ddb
- Create `backend-flask/bin/ddb/scan` and make it executable

```bash
................................
................................

{'user_uuid': '46f3e041-7154-4183-9e35-e6463fa4a987', 'user_handle': 'bayko', 'sk': '2023-03-22T14:36:25.547845+05:30', 'pk': 'MSG#5ae290ed-55d1-47a0-bc6d-fe2bc2700399', 'message_uuid': '2ae5c708-cbe3-404d-8089-2d860fd4d51a', 'message': 'Zathras was a really unique and memorable character. He was quirky and eccentric, but also had a lot of heart and sincerity.', 'user_display_name': 'Andrew Bayko'}
{'user_uuid': '2f61ee44-0bf0-4f2f-8efc-587bc05bee32', 'user_handle': 'andrewbrown', 'sk': '2023-03-22T14:37:25.547845+05:30', 'pk': 'MSG#5ae290ed-55d1-47a0-bc6d-fe2bc2700399', 'message_uuid': '19d08d52-a7cc-4ea2-b803-1450e778ae7c', 'message': 'Yes, I thought he was a great addition to the show. He added some much-needed comic relief, but also had some important moments of character development.', 'user_display_name': 'Andrew Brown'}
{'user_uuid': '46f3e041-7154-4183-9e35-e6463fa4a987', 'user_handle': 'bayko', 'sk': '2023-03-22T14:38:25.547845+05:30', 'pk': 'MSG#5ae290ed-55d1-47a0-bc6d-fe2bc2700399', 'message_uuid': '761171fa-c6c5-4097-8798-d5cf81a1c0d5', 'message': "And I appreciated the way the show used him as a sort of plot device, with his knowledge of time and space being instrumental in the resolution of some of the show's major storylines.", 'user_display_name': 'Andrew Bayko'}
................................
................................
```
