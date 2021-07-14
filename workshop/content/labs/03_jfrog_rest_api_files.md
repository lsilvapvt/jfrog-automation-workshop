
### Managing Artifacts

1. **Create a Directory** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateDirectory)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT https://$JFROG_URL/artifactory/default-generic-local/enterprise-plus-training/
  ```

2. **Deploy an Artifact** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-DeployArtifact)):    
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT https://$JFROG_URL/artifactory/default-generic-local/enterprise-plus-training/ -T @$HOME/files/find-large-videos.aql
  ```
  

3. **Set Item Properties** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-SetItemProperties)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT https://$JFROG_URL/artifactory/api/storage/default-generic-local/enterprise-plus-training?properties=type=script&recursive=1
  ```


4. **Quick Search** ([api]("https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-ArtifactSearch(QuickSearch)")):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET https://$JFROG_URL/artifactory/api/search/artifact?name=*.aql&repos=default-generic-local
  ```

5. **Delete Item** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-DeleteItem)):  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE https://$JFROG_URL/artifactory/default-generic-local/enterprise-plus-training/find-large-videos.aql
  ```

<br/>

---