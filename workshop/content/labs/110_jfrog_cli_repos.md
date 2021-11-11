
<br>

#### 1. Repositories 

<br/>

1. Create a repository

  ```execute-2
  clear
  jfrog rt repo-create ./files/superDockerRepo.json
  ```

2. Inspect the repository configuration file used above ([spec](https://www.jfrog.com/confluence/display/JFROG/Repository+Configuration+JSON)):
  ```editor:open-file
  file: ./files/superDockerRepo.json
  ```

3. Update a repository

    ```execute-2
    clear
    jfrog rt repo-update ./files/superDockerRepo.json
    ```

4. Delete a Repository

    ```execute-2
    clear
    jfrog rt repo-delete super-docker-local
    ```

<br/>

#### 2. Artifacts

<br/>

1. Upload artifacts

  Single file:
  ```execute-2
  clear
  jfrog rt upload ./files/find-large-videos.aql default-generic-local/enterprise-plus-training/find-large-videos.aql
  ```

  Multiple files: 
  ```execute-2
  jfrog rt u "./files/*.aql" default-generic-local/enterprise-plus-training/
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