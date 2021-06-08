### REST API - Authentication

<br/>

### Base URL

The Platform REST URL is constructed of:  
`<JFrog URL>/<Service Context>/`

For example: 

- Using your JFrog URL:  
  `http://myjfrog.acme.org/artifactory/`

- Using your Artifactory server hostname and port:  
  `http://ARTIFACTORY_SERVER_HOSTNAME:8081/artifactory/`

<br/>

### Authentication

Artifactory's REST API supports these forms of authentication:

- Basic authentication using your username and password  
  `curl --user $USERNAME:$ENCRYPTEDPASSWORD <JFrog URL>/<Service Context>`

- Basic authentication using your username and API Key  
  `curl --user $USERNAME:$APIKEY <JFrog URL>/<Service Context>/`

- Using a dedicated header (X-JFrog-Art-Api) with your API Key  
  `curl -H "X-JFrog-Art-Api:$APIKEY" <JFrog URL>/<Service Context>/`

- Using an access token instead of a password for basic authentication  
  `curl --user $USERNAME:$ACCESSTOKEN <JFrog URL>/<Service Context>/`

- Using an access token as a bearer token in an authorization header (Authorization: Bearer) with your access token  
  `curl -H "Authorization: Bearer $ACCESSTOKEN" <JFrog URL>/<Service Context>/`  
    
  Test the System Ping API endpoint:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" https://$JFROG_URL/artifactory/api/system/ping
  ```

  GET General System Configuration:  
  ```execute-2
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" https://$JFROG_URL/artifactory/api/system/configuration
  ```

  GET service ID 
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" https://$JFROG_URL/artifactory/api/system/service_id
  ```

  Launch JFrog Platform user interface
  ```dashboard:open-url
  name: Platform
  url: https://{{ JFROG_URL }}/
  ```

<br/>

---