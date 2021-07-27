<!-- Access Tokens Management -->

[Documentation](https://www.jfrog.com/confluence/display/JFROG/Access+Tokens).

<br/>


1. **Get All Tokens** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetTokens.1)):
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/tokens 
  ```

2. **Get Token by ID** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetTokenbyID)):
  
  Click the command below to paste it in the terminal and update the TOKEN-ID-GOES-HERE with one of the token IDs returned by the previous command:
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/tokens/TOKEN-ID-GOES-HERE 
  ```


3. **Create Access Token** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateToken.1)):
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/tokens -d @files/access/accesstoken1.json
  ```

4. **Revoke Token by ID** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-RevokeTokenbyIDrevoketokenbyid)):
  
  Click the command below to paste it in the terminal and update the TOKEN-ID-GOES-HERE with the ID of the token to be revoked. 
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/access/api/v1/tokens/TOKEN-ID-GOES-HERE 
  ```

<br/>

---