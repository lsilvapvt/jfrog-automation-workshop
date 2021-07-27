<!-- Distribution - GPG Keys management -->

[Documentation](https://www.jfrog.com/confluence/display/JFROG/GPG+Signing).

<br/>


1. **Get List of All Keys** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetKeysList)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/keys/gpg/aliases
  ```

2. **Get Details of a Key** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-GetKey)):  

  Click the command below to paste it in the terminal and update the ALIAS to one of the alias returned by the previous command above
  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/keys/gpg/ALIAS
  ```

3. **Create a GPG Key**:  

  ```copy-and-edit
  gpg --full-generate-key
  ```

4. **Export Private Key**:  

  Format: `gpg --output {private key file name and path} --armor --export-secret-keys {key-id}`

  ```copy-and-edit
  gpg --output acmedistkey.gpg --armor --export-secret-keys acmedist
  ```

5. **Export Public Key**:  

  Format: `gpg --output {public key file name and path} --armor --export {key-id}`

  ```copy-and-edit
  gpg --output acmedistpub.gpg --armor --export acmedist
  ```


6. **Build JSON file with GPG Keys**:  

  ```copy-and-edit
  cat > acmegpgkey.json << "EOF"
  {
    "key": {
       "alias": "my-default-key",
       "public_key" : "PUBLICKEYGOESHERE",
       "private_key": "PRIVATEKEYGOESHERE"
    },
    "propagate_to_edge_nodes" : false,
    "fail_on_propagation_failure": false,
    "set_as_default": false
  }  
  'EOF'
  ```


7. **Upload GPG Signing Key for Distribution** ([api](https://www.jfrog.com/confluence/display/JFROG/Distribution+REST+API#DistributionRESTAPI-UploadandPropagateGPGSigningKeysforDistribution)):  

  ```copy-and-edit
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/distribution/api/v1/keys/gpg/ \ 
  -H 'Content-Type: application/json' \
  -T acmegpgkey.json
  ```

<br/>

---