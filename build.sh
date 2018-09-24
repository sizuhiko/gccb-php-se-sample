# pull base images
gcloud docker -- pull gcr.io/cloud-builders/gcloud
docker pull composer/composer:alpine

# build composer images
docker build -t gcr.io/$PROJECT_ID/composer -f Dockerfile.composer .

# build deploy images
SERVICE_ACCOUNT=`gcloud iam service-accounts list --filter="deployer" --format="value(email)"`
docker build -t gcr.io/$PROJECT_ID/deploy \
  -f Dockerfile.deploy \
  --build-arg PROJECT_ID=$PROJECT_ID \
  --build-arg SERVICE_ACCOUNT_ID=$SERVICE_ACCOUNT \
  --build-arg KEY_FILE_NAME=./deployer.key.json \
  .

# push images
gcloud docker -- push gcr.io/$PROJECT_ID/composer
gcloud docker -- push gcr.io/$PROJECT_ID/deploy
