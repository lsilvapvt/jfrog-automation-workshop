<!-- Onboard Team automation - JFrog CLI examples -->

<br/>

1. **Create a groups of users**:
  
  ```execute-2
  clear
  jfrog rt repo-create avengers
  ```


2. **Create users**:
  
  ```execute-2
  clear
  jfrog rt user-create srogers "$LAB_PASSWORD" "srogers@avengers.com"
  ```

  ```execute-2
  clear
  jfrog rt user-create bbanner "$LAB_PASSWORD" "bbanner@avengers.com"
  ```

  ```execute-2
  clear
  jfrog rt user-create tstark "$LAB_PASSWORD" "tstark@avengers.com"
  ```

3. **Create a new project**):  
  
  Inspect the project configuration file:  
  ```editor:open-file
  file: ./files/onboard/project_avengers.json
  ```

  ```execute-2
  clear
  jfrog rt curl -X PUT /access/api/v1/projects/ -H 'Content-Type: application/json' -d @$HOME/files/onboard/project_avengers.json
  ```


4. **Add a project admin to the project**:    

  ```execute-2
  clear
  jfrog rt curl -X PUT /access/api/v1/projects/avngrs/users/srogers \
  -H 'Content-Type: application/json' \
  -d '{
    "name" : "srogers",
    "roles" : ["Project Admin"]
  }'
  ```  

5. **Add a group to the project**:    
  
  ```execute-2
  clear
  jfrog rt curl -X PUT /access/api/v1/projects/avngrs/groups/avengers \
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

  ```execute-2
  jfrog rt rc @$HOME/files/onboard/repo_docker_dev_local.json
  ```

  ```execute-2
  jfrog rt rc @$HOME/files/onboard/repo_docker_prod_local.json
  ```
  
---