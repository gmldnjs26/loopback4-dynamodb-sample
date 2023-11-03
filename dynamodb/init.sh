# 테이블 생성
aws dynamodb \
    --region ap-northeast-1 \
    --endpoint-url http://dynamodb:8000 \
    delete-table \
    --table-name User \

aws dynamodb create-table \
    --table-name User \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
        AttributeName=email,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
        AttributeName=email,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://dynamodb:8000/  # 로컬 DynamoDB의 URL

# 데이터 삽입
aws dynamodb put-item \
    --table-name User \
    --item '{"id": {"S": "1"},"email": {"S": "user@example.com"},"name": {"S": "John Doe"}}' \
    --endpoint-url http://dynamodb:8000/  # 로컬 DynamoDB의 URL
aws dynamodb put-item \
    --table-name User \
    --item '{"id": {"S": "2"},"email": {"S": "user2@example.com"},"name": {"S": "Janny Eo"}}' \
    --endpoint-url http://dynamodb:8000/  # 로컬 DynamoDB의 URL
