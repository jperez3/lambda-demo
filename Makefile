default:
	cat make_help.md

start-music:
	open https://www.youtube.com/watch?v=6LIQUI1Od6U

docker-init:
	rm -rf /tmp/docker-python-lambda-builder
	git clone git@github.com:jperez3/docker-python-lambda-builder.git /tmp/docker-python-lambda-builder
	docker build /tmp/docker-python-lambda-builder/ -t jperez3/python-lambda-builder:latest
	rm -rf /tmp/docker-python-lambda-builder

docker-cleanup:
	docker rmi jperez3/python-lambda-builder
	docker rmi amazonlinux	

lambda-build:
	docker run \
	--rm --name lambda \
	-v $$(pwd)/lambda:/app/lambda \
	jperez3/python-lambda-builder:latest

lambda-debug:
	docker run -it -v $$(pwd)/lambda:/app/lambda jperez3/python-lambda-builder:latest /bin/bash

lambda-lint:
	docker run -it -v $$(pwd)/lambda:/app/lambda jperez3/python-lambda-builder:latest /usr/local/bin/pylint /app/lambda/app.py

lambda-upload:
	aws lambda --profile lambda-demo update-function-code --function-name demo_testservice_stg_useast1_example_com --zip-file fileb://lambda/lambda.zip

lambda-invoke:
	aws lambda --profile lambda-demo invoke \
    --function-name=demo_testservice_stg_useast1_example_com \
    --invocation-type=RequestResponse \
    --payload='{ "test": "value" }' \
    --log-type=Tail \
    /dev/null | jq -r '.LogResult' | base64 --decode

lambda-refresh:
	make lambda-build lambda-upload lambda-invoke	

tf-init:
	terraform init terraform/ && terraform plan terraform/

tf-apply:
	terraform apply terraform/

tf-destroy:
	terraform destroy terraform/		