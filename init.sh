gcloud auth login

gcloud config set project $PROJECT_ID
gcloud iam service-accounts create deployer --display-name "Deploy Account"

SERVICE_ACCOUNT=`gcloud iam service-accounts list --filter="deployer" --format="value(email)"`
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/appengine.deployer'

gcloud iam service-accounts keys create ./deployer.key.json --iam-account $SERVICE_ACCOUNT
