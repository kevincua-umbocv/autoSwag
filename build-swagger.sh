swag init

git clone --branch v2.4.44 https://github.com/swagger-api/swagger-codegen --single-branch
cd swagger-codegen
./run-in-docker.sh mvn package

cp -r ../docs ./swaggerdocs
./run-in-docker.sh generate -i ./swaggerdocs/swagger.yaml -l typescript-jqury -o ./swaggerdocs/jquery

npm install -g @angular/cli

./run-in-docker.sh generate -i ./swaggerdocs/swagger.yaml -l dynamic-html -o ./swaggerdocs/dynamic-html

wget https://github.com/swagger-api/swagger-ui/archive/refs/heads/master.zip
unzip master.zip
mv swagger-ui-master swagger-ui

aws s3 sync swagger-ui/dist s3://my-swagger-ui --acl public-read
