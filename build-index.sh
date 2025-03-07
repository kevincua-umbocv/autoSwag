git clone --branch v2.4.44 https://github.com/swagger-api/swagger-codegen --single-branch
cd swagger-codegen
./run-in-docker.sh mvn package

cp -r ../docs ./swaggerdocs
./run-in-docker.sh generate -i ./swaggerdocs/swagger.yaml -l html2 -o ./swaggerdocs/html
