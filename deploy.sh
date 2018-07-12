gcloud auth activate-service-account $ACCOUNT --key-file /$KEY_FILE_NAME

gcloud config set project $PROJECT_ID

gcloud app deploy app/app.yml
