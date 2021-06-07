### REST API - Authentication

<br/>

### Base URL

The Platform REST URL is constructed of: `<JFrog URL>/<Service Context>/`

For example: 

- Using your JFrog URL:  
  `http://myjfrog.acme.org/artifactory/`

- Using your Artifactory server hostname and port:  
  `http://ARTIFACTORY_SERVER_HOSTNAME:8081/artifactory/`

<br/>

### Authentication

Artifactory's REST API supports these forms of authentication:

- Basic authentication using your username and password  
  e.g. `curl --user $USERNAME:$ENCRYPTEDPASSWORD <JFrog URL>/<Service Context>/`

- Basic authentication using your username and API Key  
  e.g. `curl --user $USERNAME:$APIKEY <JFrog URL>/<Service Context>/`

- Using a dedicated header (X-JFrog-Art-Api) with your API Key  
  e.g. `curl -H "X-JFrog-Art-Api:$APIKEY" <JFrog URL>/<Service Context>/`

- Using an access token instead of a password for basic authentication  
  e.g. `curl --user $USERNAME:$ACCESSTOKEN <JFrog URL>/<Service Context>/`

- Using an access token as a bearer token in an authorization header (Authorization: Bearer) with your access token
  e.g. `curl -H "Authorization: Bearer $JFROGACCESSTOKEN" <JFrog URL>/<Service Context>/`  
    
  Test it with the system ping API endpoint:  
  ```execute
  curl -H "Authorization: Bearer $JFROGACCESSTOKEN" https://$JFROG_URL/artifactory/api/system/ping
  ```


Artifactory server [link](https://$JFROG_URL)

```copy-and-edit
   echo Hello!
```

<br/>

---