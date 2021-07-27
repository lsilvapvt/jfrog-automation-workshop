<!-- Distribution Service Inspection -->

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

---