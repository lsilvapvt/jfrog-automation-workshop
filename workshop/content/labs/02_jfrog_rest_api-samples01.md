### REST API - Repositories and Artifacts

<br/>

### Managing Repositories with the REST API

1. **Get all repositories** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetRepositories)):  
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" https://$JFROG_URL/artifactory/api/repositories
  ```

2. **Create a repository** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateRepository)):  
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" -X PUT 'https://$JFROG_URL/artifactory/api/repositories/super-docker-local' -H 'Content-Type: application/json' -d @~/files/superDockerRepo.json
  ```

3. Inspect the repository configuration file used above ([spec](https://www.jfrog.com/confluence/display/JFROG/Repository+Configuration+JSON)):
  ```editor:open-file
  file: ~/files/superDockerRepo.json
  ```

4. **Retrieve a repository's information** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-RepositoryConfiguration)):
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" -X GET 'https://$ JFROG_URL/artifactory/api/repositories/super-docker-local'
  ```

5. Change the repository configuration file to enable XRay indexing (set value to true) ([spec](https://www.jfrog.com/confluence/display/JFROG/Repository+Configuration+JSON)) and save the file:
  ```editor:open-file
  file: ~/files/superDockerRepo.json
  text: "xrayIndex" : \"false\""
  ```

6. **Update the repository** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-UpdateRepositoryConfiguration):
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" -X POST 'https://$ JFROG_URL/artifactory/api/repositories/super-docker-local' -H 'Content-Type: application/json' -d @superDockerRepo.json
  ```

7. **Delete the repository** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-DeleteRepository):
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" -X DELETE 'https://$ JFROG_URL/artifactory/api/repositories/super-docker-local'
  ```

<br/>

---