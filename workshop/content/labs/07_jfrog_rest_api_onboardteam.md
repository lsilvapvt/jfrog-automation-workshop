<!-- Onboard Team automation -->

<!-- [Documentation](https://www.jfrog.com/confluence/display/JFROG/Access+Tokens). -->

<br/>

1. **Create a groups of users** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateorReplaceGroup)):
  
  Inspect the project configuration file:  
  ```editor:open-file
  file: ./files/onboard/group_avengers.json
  ``` 

  Create the group of users
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/security/groups/avengers -H "Content-Type: application/json" -d @$HOME/files/onboard/group_avengers.json
  ```


2. **Create users** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateorReplaceUser)):
  
  Inspect the project configuration file:  
  ```editor:open-file
  file: ./files/onboard/user_steve_rogers.json
  ``` 

  Create the internal users
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/security/users/srogers -H "Content-Type: application/json" -d @$HOME/files/onboard/user_steve_rogers.json
  ```

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/security/users/bbanner -H "Content-Type: application/json" -d @$HOME/files/onboard/user_bruce_banner.json
  ```

```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/security/users/nromanoff -H "Content-Type: application/json" -d @$HOME/files/onboard/user_natasha_romanoff.json
  ```

```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/security/users/tstark -H "Content-Type: application/json" -d @$HOME/files/onboard/user_tony_stark.json
  ```

3. **Create a new project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-AddaNewProject)):  
  
  Inspect the project configuration file:  
  ```editor:open-file
  file: ./files/onboard/project_avengers.json
  ```  
  
  Execute the REST API command to create the new project:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/ -H 'Content-Type: application/json' -d @$HOME/files/onboard/project_avengers.json
  ```



4. **Add a project admin to the project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-UpdateUserinProject)):    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/avngrs/users/srogers \
  -H 'Content-Type: application/json' \
  -d '{
    "name" : "srogers",
    "roles" : ["Project Admin"]
  }'
  ```  

5. **Add a group to the project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-UpdateGroupinProject)):    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/avngrs/groups/avengers \
  -H 'Content-Type: application/json' \
  -d '{
    "name" : "avengers",
    "roles" : ["Developer"]
  }'
  ```

6. **Create repositories** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateRepository)):  

  Inspect the repository configuration file:  
  ```editor:open-file
  file: ./files/onboard/repo_docker_dev_local.json
  ```  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories/avngrs-docker-dev-local -H "Content-Type: application/json" -d @$HOME/files/onboard/repo_docker_dev_local.json
  ```
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/repositories/avngrs-docker-prod-local -H "Content-Type: application/json" -d @$HOME/files/onboard/repo_docker_prod_local.json
  ```
  
---

## TBD 

- Create 3 repositories for the project, 1 Dev, 2 Prod 
- Create 1 pipeline for the project with a promotion sample 
- Cleanup 
  Delete pipelines, repositories, project, group and users 

---