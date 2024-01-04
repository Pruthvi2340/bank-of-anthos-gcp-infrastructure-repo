# Intial setup
```
export PROJECT=$(gcloud config get-value project)
gsutil mb gs://$PROJECT-bank-of-anthos-tf-state
sed -i "s/bucket = \"bank-of-anthos-tf-state\"/bucket = \"$PROJECT-bank-of-anthos-tf-state\"/" main.tf

terraform init
terraform apply -var project_id=$PROJECT -auto-approve
```
