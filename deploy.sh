gcloud auth activate-service-account $ACCOUNT --key-file /$KEY_FILE_NAME

gcloud config set project "gccb-php-se-sample"

gcloud app deploy app/app.yml
