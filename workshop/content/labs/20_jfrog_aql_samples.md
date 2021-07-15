
<br>

#### 1. Using curl 

<br/>

1. Inline AQL search

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL//artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find(
    {
        "repo":{"$eq":"default-generic-local"}
    }
  )'
  ```


2. Find largest files using AQL file

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL//artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d $HOME/files/find-largest-files.aql
  ```

  Inspect the AQL file:
  ```editor:open-file
  file: ./files/find-largest-files.aql
  ```

curl -uadmin:password -X POST \
http://10.233.10.240/artifactory/api/search/aql \
-H 'Content-Type: text/plain' \
-d 'items.find({"stat.downloads":{"$gt":"1"}})'


3. Find all files downloaded more than once

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL//artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find({"stat.downloads":{"$gt":"1"}})'
  ```


4. Complex Search

  ```execute
  clear
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL//artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find(
    {“type":"file",
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


#### 2. Artifacts

<br/>

1. Upload an artifact

  ```execute-2
  clear
  jfrog rt upload ./files/find-large-videos.aql default-generic-local/enterprise-plus-training/find-large-videos.aql
  ```

2. Search for an artifact

  ```execute-2
  clear
  jfrog rt search "default-generic-local/enterprise-plus-training/*.aql" 
  ```

3. Set properties for an artifact

  ```execute-2
  clear
  jfrog rt set-props "default-generic-local/enterprise-plus-training/*.aql" "type=script;tested=no"
  ```

4. Delete artifacts

  ```execute-2
  clear
  jfrog rt delete "default-generic-local/enterprise-plus-training/*.aql"
  ```


<br/>


---