
<br>

#### 1. Using curl 

<br/>

1. Inline AQL search

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
    -H 'Content-Type: text/plain' \
    -d 'items.find(
      {
        "repo":{"$eq":"default-generic-local"}
      })'
  ```


2. Find largest files using AQL file

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
    -H 'Content-Type: text/plain' \
    -d @files/find-largest-files.aql
  ```

  Inspect the AQL file:
  ```editor:open-file
  file: ./files/find-largest-files.aql
  ```

3. Find all files downloaded more than 15 times

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
    -H 'Content-Type: text/plain' \
    -d 'items.find({"stat.downloads":{"$gt":"15"}}).include("name","path","repo","size","stat.downloads")'
  ```


4. Complex Search

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find(
      { "type":"file",
        "size":{"$lt":"1000000000"},
        "stat.downloads":{"$eq":null},
        "@team":"dev",
        "$or":[
            {"name":{"$match":"*.png"}},
            {"name":{"$match":"*.jpg"}}
        ]
      }
      ).include("name","size")
      .sort({"$desc":["size","name"]})'
  ```

  Looking for image files PNG or JPG that:
  - are smaller than the defined size
  - that have a property `team=dev`
  - that have never been downloaded 
  - for the output - only include name and size field 
  - sort it first by size and then by name in ascending manner


<br/>


#### 2. Generate AQL from the CLI

<br/>

  ```execute-2
  clear
  export JFROG_CLI_LOG_LEVEL=DEBUG
  jfrog rt search "default-generic-local/*.png" 
  ```

<br/>


---