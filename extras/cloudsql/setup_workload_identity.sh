# !/bin/bash

export KSA_NAME="boa-ksa"
export GSA_NAME="boa-gsa"


gcloud config set project ${PROJECT_ID}

echo "✅ Creating namespace..."
kubectl create namespace $NAMESPACE

echo "✅ Creating GCP and K8s service accounts..."
kubectl create serviceaccount --namespace $NAMESPACE $KSA_NAME

SA_EXISTS=$(gcloud iam service-accounts list --filter="${GSA_NAME}" | wc -l)
if [ $SA_EXISTS = "0" ]; then
   gcloud iam service-accounts create $GSA_NAME
fi

echo "✅ Annotating service accounts to connect your GSA and KSA..."
gcloud iam service-accounts add-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:${PROJECT_ID}.svc.id.goog[$NAMESPACE/$KSA_NAME]" \
  $GSA_NAME@$PROJECT_ID.iam.gserviceaccount.com

kubectl annotate serviceaccount \
  --namespace $NAMESPACE \
  $KSA_NAME \
  iam.gke.io/gcp-service-account=$GSA_NAME@$PROJECT_ID.iam.gserviceaccount.com


echo "✅ Granting Service account permissions..."
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member "serviceAccount:${GSA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role roles/cloudtrace.agent

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member "serviceAccount:${GSA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role roles/monitoring.metricWriter

gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member "serviceAccount:${GSA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role roles/cloudsql.client

echo "⭐️ Done."
