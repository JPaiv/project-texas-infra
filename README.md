## project-texas-infra ##
Basic infrastrucsture for a GKE cluster with a VPC to run a python container with an endpoint.


# How to use #
First you need to configure basic access in the form of [keyless authentication](https://cloud.google.com/blog/products/identity-security/enable-keyless-access-to-gcp-with-workload-identity-federation).

In traditional CI/CD pipeline model we have to worry about 2 things:

1. IAM management
2. Secret management 

Keyless authentication will remove the second part. No longer are service account keys required for deployments.

Point of keyless authentication is to get a temporal access token that is valid for 1 hour. 

We have a GCP service account and a workload identity federation to gain access to these resources.

This step requires using gcloud console commands because workload identity and service account need to be in place fo the pipeline to work.

In this task we use [GCP keyless authentication plugin for Github Actions](https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions).

Command 1:

gcloud iam workload-identity-pools create "<replace_with_your_pool_name>" \
  --project="${PROJECT_ID}" \ # Place the project ID in an env variable export = <project_id>
  --location="global" \
  --display-name="<replace_with_your_pool_display_name>"

Command 2:

gcloud iam workload-identity-pools providers create-oidc "<replace_with_your_provider_name>" \
  --project="${PROJECT_ID}" \ # Place the project ID in an env variable export = <project_id>
  --location="global" \
  --workload-identity-pool="<replace_with_your_pool_display_name>" \
  --display-name="Demo provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud" \
  --issuer-uri="https://token.actions.githubusercontent.com"


Run those two commands in console after you have configured and gcloud init.

After this go to Github repo [Settings](readme_pictures/settings.png) -> [Secrets](readme_pictures/settings.png) and place service account and workload identity provider as secrets for the CI/CD pipeline.

After this the hard work part is over and you have an automatic pipeline ready to go!


# How to trigger builds #

Just push the commits to the main branch. 
