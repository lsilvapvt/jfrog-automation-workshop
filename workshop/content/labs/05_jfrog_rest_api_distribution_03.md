<!-- Distribution - Release Bundle Management -->

[Documentation](https://www.jfrog.com/confluence/display/JFROG/JFrog+Distribution#JFrogDistribution-TheDistributionFlow).

<br/>


1. **Get All Versions of All Release Bundles** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetallVersionsofallReleaseBundles)): 
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle?start_pos=0
  ```


2. **Get Release Bundle Versions** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetReleaseBundleVersions)):  

  Click the command below to paste it in the terminal and update the BUNDLE with the desired release bundle ID
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/BUNDLE
  ```


3. **Create a Release Bundle Version** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-CreateReleaseBundleVersion)):   
  
  Inspect the release bundle configuration file:  
  ```editor:open-file
  file: ./files/bundles/createbundle1.json
  ```  
  
  Execute the REST API command to create the release bundle version:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle -T files/bundles/createbundle1.json
  ```

  If the GPG Key in use contains a passphrase, pass it as part of the command:
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -H "X-GPG-PASSPHRASE: PASSPHRASE_GOES_HERE"  -X POST $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle -T createbundle1.json -T files/bundles/createbundle1.json
  ```

4. **Update a Release Bundle Version** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-UpdateReleaseBundleVersion)):    
  
  Inspect the release bundle configuration file:  
  ```editor:open-file
  file: ./files/bundles/updatebundle1.json
  ```  
  
  Execute the REST API command to update the release bundle version:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/TheMailerRelease/1.0 -T @files/bundles/updatebundle1.json
  ```

5. **Sign a Release Bundle Version** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-SignReleaseBundleVersion)):    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/TheMailerRelease/1.0/sign
  ```

6. **Distribute a Release Bundle Version** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-DistributeReleaseBundleVersion)):    
  
  Inspect the distribution configuration file:  
  ```editor:open-file
  file: ./files/bundles/distributebundle1.json
  ```  
  
  Execute the REST API command to distribute the release bundle version:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X PUT $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/distribution/TheMailerRelease/1.0 -T @files/bundles/distributebundle1.json
  ```

7. **Get Distribution Status for a Release Bundle Version** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetDistributionStatusDetailsbyReleaseBundleVersion)):    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/TheMailerRelease/1.0/distribution
  ```


8. **Get Status of All Distributions** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetDistributionStatusDetails)):    
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/release_bundle/distribution
  ```


<br/>

---