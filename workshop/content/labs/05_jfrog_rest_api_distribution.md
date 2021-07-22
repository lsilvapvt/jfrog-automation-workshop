
[Documentation](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API).

<br/>

### Distribution Service Inspection


1. **Test Connection to Distribution Service** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-TestConnection)):  

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/system/ping
  ```

2. **Get Distribution Service System Information** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetSystemInfo)):  
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/system/info
  ```

3. **Get Distribution Service System Settings** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetSystemSettings)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/system/settings
  ```

<br/>

### GPG Keys Management 


4. **Get List of All Keys** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetKeysList)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/keys/gpg/aliases
  ```

5. **Get Details of a Key** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetKey)):  

  Click the command below to paste it in the terminal and update the ALIAS to one of the alias returned by the previous command above
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/keys/gpg/ALIAS
  ```


<br/>

### Distribution Releases Management

6. **Get All Versions of All Release Bundles** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetallVersionsofallReleaseBundles)):  :    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle?start_pos=0
  ```


7. **Get Release Bundle Versions** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetReleaseBundleVersions)):  

  Click the command below to paste it in the terminal and update the BUNDLE with the desired release bundle ID
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/BUNDLE
  ```

<br/>

---