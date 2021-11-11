
## AQL sample queries for artifacts clean up tasks


1. Find top 10 largest files across all repositories

  ```
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
    -H 'Content-Type: text/plain' \
    -d 'items.find({"type":"file"}).include("name","path","repo","size").sort({"$desc":["size"]}).limit(10)'
  ```

2. Find all files downloaded that have never downloaded

  ```
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
    -H 'Content-Type: text/plain' \
    -d 'items.find({"stat.downloads":{"$eq":null}}).include("name","path","repo","size")'
  ```


3. Find all files for a repo sorted by size and name

  ```
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find(
      { "type":"file",
        "repo":"go-dev-local"
      }
      ).include("name","size")
      .sort({"$desc":["size","name"]})'
  ```

4. Find all files from a specific repo and which names are "lower" than a specific string, sorted by name

  ```
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/artifactory/api/search/aql  \
  -H 'Content-Type: text/plain' \
  -d 'items.find(
      { "type":"file",
        "repo":"go-dev-local",
        "name":{"$lt":"v1.0.39.*info*"}
      }
      ).include("name","path")
      .sort({"$asc":["name"]})'
  ```

---

### How to use the output of an AQL in CLI commands

The output of an AQL can be used to build a JSON object in [FileSpec format](https://www.jfrog.com/confluence/display/JFROG/FileSpec) to be used as the input for a JFrog CLI delete command.

See [this sample script](https://gist.github.com/lsilvapvt/8917142abbfe177ed6d6ec08f8d7ab65) for a technique on how that can be done.

<br/>


---