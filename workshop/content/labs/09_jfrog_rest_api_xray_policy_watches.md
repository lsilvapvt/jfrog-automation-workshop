<!-- XRay Policies and Watches -->

<!-- https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-CreateWatch -->

<br/>

**XRay Policies**

[Documentation](https://www.jfrog.com/confluence/display/JFROG/Creating+Xray+Policies+and+Rules).

<br/>


1. **Get All XRay Policies** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-GetPolicies)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies
  ```
  
2. **Get a specific XRay Policy** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-GetPolicy)):  
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/sec_policy
  ```


3. **Create an XRay Policy** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-CreatePolicy)):
  
  Inspect the security policy configuration file:  
  ```editor:open-file
  file: ./files/xray/security_policy.json
  ``` 

  Create the security policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies -H "Content-Type: application/json" -d @$HOME/files/xray/security_policy.json
  ```

  Inspect the licenses policy configuration file:  
  ```editor:open-file
  file: ./files/xray/licenses_policy.json
  ``` 

  Create the licenses policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies -H "Content-Type: application/json" -d @$HOME/files/xray/licenses_policy.json
  ```

4. **Update an XRay Policy** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-UpdatePolicy)):
  
  Inspect the security policy update configuration file:  
  ```editor:open-file
  file: ./files/xray/security_policy_updated.json
  ``` 

  Update the security policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/Security-Policy -H "Content-Type: application/json" -d @$HOME/files/xray/security_policy_updated.json
  ```

  Inspect the licenses policy update configuration file:  
  ```editor:open-file
  file: ./files/xray/licenses_policy_updated.json
  ``` 

  Update the licenses policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/Licenses-Policy -H "Content-Type: application/json" -d @$HOME/files/xray/licenses_policy_updated.json
  ```

5. **Delete an XRay Policy** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-UpdatePolicy)):
  
  Delete the security policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/Security-Policy
  ```

  Delete the licenses policy
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/policies/Licenses-Policy
  ```

---

<br/>

**XRay Watches**

[Documentation](https://www.jfrog.com/confluence/display/JFROG/Configuring+Xray+Watches).

<br/>

6. **Get All XRay Watches** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-GetWatches)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches
  ```

7. **Get a specific XRay Watch** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-GetWatch)):  
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches/demo_watch
  ```

8. **Create an XRay Watch** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-GetWatch)):  
  
  Inspect the watch configuration file:  
  ```editor:open-file
  file: ./files/xray/generic_watch.json
  ``` 

  Create the watch
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches -H "Content-Type: application/json" -d @$HOME/files/xray/generic_watch.json
  ```

9. **Update an XRay Watch** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-UpdateWatch)):  
  
  Inspect the watch update configuration file:  
  ```editor:open-file
  file: ./files/xray/generic_watch_updated.json
  ``` 

  Update the watch
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches/generic_watch -H "Content-Type: application/json" -d @$HOME/files/xray/generic_watch_updated.json
  ```

10. **Delete an XRay Watch** ([api](https://www.jfrog.com/confluence/display/JFROG/Xray+REST+API#XrayRESTAPI-DeleteWatch)):  
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/xray/api/v2/watches/generic_watch
  ```

---