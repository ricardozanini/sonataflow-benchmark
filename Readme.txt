
1) build the images using

cd sh

./build-image-1.35.0.sh

./build-image-1.36.0.sh

./build-image-1.36.0-persistence.sh

2) deploy the workflows using:

cd sh

./deploy-1.35.0.sh

./deploy-1.36.0.sh

./deploy-1.36.0-persistence.sh

3) execution

Execute locally:

NOTE, the url might change in your enviroment, you can see it in the console when deploying the workflows.

curl -X POST -H 'Content-Type:application/json' -H 'Accept:application/json' -d '{"id": 12345}'  http://petstore/petstore

curl -X POST -H 'Content-Type:application/json' -H 'Accept:application/json' -d '{"id": 12345}' http://petstore-sonataflow-benchmark-1-35-0.apps-crc.testing/petstore

curl -X POST -H 'Content-Type:application/json' -H 'Accept:application/json' -d '{"id": 12345}'  http://petstore-sonataflow-benchmark-1-36-0.apps-crc.testing/petstore

curl -X POST -H 'Content-Type:application/json' -H 'Accept:application/json' -d '{"id": 12345}'  http://petstore-sonataflow-benchmark-1-36-0-persistence.apps-crc.testing/petstore


./run.sh 10 'curl -X POST -H '\''Content-Type:application/json'\'' -H '\''Accept:application/json'\'' -d '\''{"id": 12345}'\'' http://petstore-sonataflow-benchmark-1-35-0.apps-crc.testing/petstore'

etc