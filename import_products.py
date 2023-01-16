"""
COPY DYNAMODB TABLE ITEMS TO ANOTHER TABLE
AWS_CLI supposed te be installed and configured with `aws configure`
"""
import boto3

ddb = boto3.resource('dynamodb')

origin_table = ddb.Table('origin_table_name')
destination_table = ddb.Table('destination_table_name')


def copying_to_new_table():
	response = origin_table.scan()
	data = response['Items']
	while 'LastEvaluatedKey' in response:
		response = transactable.scan(ExclusiveStartKey=response['LastEvaluatedKey'])
		data.extend(response['Items'])
	n=1
	for row in data:
		""" delete columns if needed """
		# del row['column_name']
		destination_table.put_item(Item=row)
		print(f'row {n} created ')
		n+=1
	print("DONE WITH IMPORTING")


copying_to_new_table()
