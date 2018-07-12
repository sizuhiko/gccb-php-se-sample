gcloud auth login

gcloud config set project $PROJECT_ID
gcloud iam service-accounts create deployer --display-name "Deploy Account"

SERVICE_ACCOUNT=`gcloud iam service-accounts list --filter="deployer" --format="value(email)"`
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/appengine.deployer'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/appengine.serviceAdmin'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/compute.storageAdmin'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/cloudbuild.builds.editor'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT" --role='roles/storage.admin'

gcloud iam service-accounts keys create ./deployer.key.json --iam-account $SERVICE_ACCOUNT

# enable APIs
gcloud services enable appengine.googleapis.com
gcloud app create --region=asia-northeast1
gcloud services enable containerregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
