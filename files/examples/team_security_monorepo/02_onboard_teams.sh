#!/bin/bash

# This sequence of commands simulates how a team workflow 
# could be automated by using your preferred CI automation tool 
# along with the JFROG REST API commands.

set -e

######### PRE_REQ
## 1) git clone this repository and `cd` into the folder where this script is located
##      git clone https://github.com/lsilvapvt/jfrog-automation-workshop.git
##      cd jfrog-automation-workshop/files/examples/team_security
## 2) Define the following env variables before running this script 
##    export JFROG_ACCESSTOKEN=<your_jfrog_access_token>
##    export JFROG_PROTOCOL=<http or https>   
##    export JFROG_URL=<my-jfrog-platform-domain>  e.g. "myartifactory.jfrog.io"
## 3) Have the expected repositories and files created/uploaded as
##    done by script 01_prep_test_env.sh

## Script execution

export devMonoRepoName="acmeco-generic-dev-local"
export prodMonoRepoName="acmeco-generic-dev-local"

cat ./teams.txt | while read teamEntry
do
   TEAMNAME=$(echo "$teamEntry" | cut -d "/" -f 1 | tr -d " ")
   TEAM_SUBFOLDER=$(echo "$teamEntry" | cut -d "/" -f 2 | tr -d " ")

   # echo "Create a webhook for the team - TBD"

   echo "Create a folder in the Dev repository for the team"
   curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
      -X PUT ${JFROG_PROTOCOL}://${JFROG_URL}/artifactory/${devMonoRepoName}/${TEAMNAME}/${TEAM_SUBFOLDER}

   # echo "Define permissions for the team to access the folder - TBD"

   echo "Create an XRay watch for the team. TBD: connect with webhook or Jira profile"

   sed "s/TEAMNAME/${TEAMNAME}_${TEAM_SUBFOLDER}/g" xray_team_watch.json > xray_team_watch_tmp.json
   sed -i "s/REPOSITORYNAME/$devMonoRepoName/g" xray_team_watch_tmp.json
   sed -i "s/TEAMFOLDERPATH/${TEAMNAME}\/${TEAM_SUBFOLDER}/g" xray_team_watch_tmp.json

   curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" \
      -X POST $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches \
      -H "Content-Type: application/json" \
      -d @xray_team_watch_tmp.json

done 
echo "End of script, success!"
