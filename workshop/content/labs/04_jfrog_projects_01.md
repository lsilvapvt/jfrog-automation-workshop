
1. **Get all projects** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-PROJECTS)):  
  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects
  ```

2. **Create a new project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-AddaNewProject)):  
  
  Inspect the project configuration file:  
  ```editor:open-file
  file: ./files/projects/shire_project.json
  ```  
  
  Execute the REST API command to create the new project:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/ -H 'Content-Type: application/json' -d @$HOME/files/projects/shire_project.json
  ```

3. **Get details of a project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetProject)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire
  ```

4. **Update configuration of an existing project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-UpdateExistingProjectProperties)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire -H 'Content-Type: application/json' -d @$HOME/files/projects/shire_project.json
  ```

5. **Add members to an existing project**:    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire/users/bilbo \
  -H 'Content-Type: application/json' \
  -d '{
    "name" : "bilbo",
    "roles" : ["Developer"]
  }'
  ```
    
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire/users/frodo \
  -H 'Content-Type: application/json' \
  -d '{
    "name" : "frodo",
    "roles" : ["Project Admin"]
  }'
  ```    

6. **List users of an existing project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetProjectUsers)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire/users
  ```


7. **Update member configuration of an existing project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-UpdateUserinProject)):    
  
  Make a member a project administrator:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire/users/bilbo \ 
  -H 'Content-Type: application/json' \
  -d '{ 
    "name" : "bilbo", 
    "roles" : ["Project Admin"] 
  }'
  ```  

  Assign the Developer role to a project member:   
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire/users/frodo \ 
  -H 'Content-Type: application/json' \
  -d '{ 
    "name" : "frodo", 
    "roles" : ["Developer"] 
  }'
  ```

8. **Delete an existing project** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-DeleteExistingProject)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/projects/shire
  ```


<br/>

---