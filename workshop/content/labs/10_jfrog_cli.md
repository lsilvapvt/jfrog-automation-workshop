
<br>

#### 1. JFrog CLI Plugins  

[Documentation](https://github.com/jfrog/jfrog-cli-plugins-reg)   

<br/>

1. Install a plugin  

  ```execute-2
  clear
  jfrog plugin install rt-fs
  ```

2. Configure the JFrog CLI target server  

    ```execute-2
    jfrog config add lab1 --url "$JFROG_PROTOCOL://$JFROG_URL" --access-token "$JFROG_ACCESSTOKEN" --overwrite --interactive=false
    ```

<br/>

3. Invoke plugin command  

  ```execute-2
  jfrog rt-fs ls default-generic-local
  ```

<br/>


<br/>

---