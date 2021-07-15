
<br>

1. Upload multiple files to multiple folders or repos in one command

  ```execute-2
  clear
  jfrog rt u --spec ./files/upload-aqls-spec.json
  ```

  Inspect the spec file:
  ```editor:open-file
  file: ./files/upload-aqls-spec.json
  ```


2. Download multiple files and transform target file names 

  ```execute-2
  clear
  jfrog rt download --spec ./files/download-aqls.json
  ```

  Inspect the spec file:
  ```editor:open-file
  file: ./files/download-aqls.json
  ```

3. Search with AQL 
   
  ```execute-2
  clear
  jfrog rt s --spec ./files/find-largest-files.json
  ```

  Inspect the spec file:
  ```editor:open-file
  file: ./files/find-largest-files.json
  ```

4. Delete multile files and folders 

  ```execute-2
  clear
  jfrog rt delete --spec ./files/delete-all-aqls.json
  ```

  Inspect the spec file:
  ```editor:open-file
  file: ./files/delete-all-aqls.json
  ```


<br/>


---