source ../../.env
export POSTGRESS_USERNAME
export POSTGRESS_PASSWORD
export POSTGRESS_DB
export POSTGRESS_HOST
export AWS_REGION
export AWS_PROFILE
export AWS_BUCKET

docker-compose -f docker-compose-build.yaml build --parallel
docker-compose up