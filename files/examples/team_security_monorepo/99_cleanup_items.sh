#!/bin/bash

# This sequence of commands deletes all items 
# created for the demo from the targeted environment

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

## Script execution

## Delete TEAM assets 

cat ./teams.txt | while read teamEntry
do
   TEAMNAME=$(echo "$teamEntry" | cut -d "/" -f 1 | tr -d " ")
   TEAM_SUBFOLDER=$(echo "$teamEntry" | cut -d "/" -f 2 | tr -d " ")

   echo "Delete XRay watch for ${TEAMNAME}_${TEAM_SUBFOLDER}"
   export watchName="acmeco_${TEAMNAME}_${TEAM_SUBFOLDER}_watch"
   curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
      -X DELETE $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches/${watchName}

   # echo "Delete webhooks"
   # echo "Delete Folder from Dev Repository" 

done

## Delete generic assets 
echo "Delete XRay policy"
curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
     -X DELETE $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/acmeco_security_policy
echo "Delete Dev repository"
curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
   -X DELETE $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories/acmeco-generic-dev-local
echo "Delete Prod repository"
curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
   -X DELETE $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories/acmeco-generic-prod-local

echo "End of script, success!"
