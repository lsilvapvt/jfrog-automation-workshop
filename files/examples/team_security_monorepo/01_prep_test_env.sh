#!/bin/bash

# This sequence of commands prepares the environment 
# for the execution of the team onboarding demo script
# 02_onboard_teams.sh

set -e

######### PRE_REQ
## 1) git clone this repository and `cd` into the folder where this script is located
##      git clone https://github.com/lsilvapvt/jfrog-automation-workshop.git
##      cd jfrog-automation-workshop/files/examples/team_security
## 2) Define the following env variables before running this script 
##    export JFROG_ACCESSTOKEN=<your_jfrog_access_token>
##    export JFROG_PROTOCOL=<http or https>   
##    export JFROG_URL=<my-jfrog-platform-domain>  e.g. "myartifactory.jfrog.io"
## 3) Run this script 
##    ./01_prep_test_env.sh

## Script execution

echo "Creating test Dev and Prod repositories"

curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
   -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories \
   -H "Content-Type: application/json" \
   -d @repo_generic_dev_local.json

curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
   -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories \
   -H "Content-Type: application/json" \
   -d @repo_generic_prod_local.json

echo "Upload test files into Dev repository"

echo "Create a generic XRay policy"

curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
   -X POST $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies \
   -H "Content-Type: application/json" \
   -d @xray_main_security_policy.json


echo "End of script, success!"
