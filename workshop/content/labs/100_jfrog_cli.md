
<br>

#### 1. JFrog CLI Configuration

[Documentation](https://www.jfrog.com/confluence/display/CLI/JFrog+CLI#JFrogCLI-JFrogCLIv2)   

<br/>

1. Inspect the CLI version

  ```execute-2
  clear
  jfrog -v
  ```

2. Configure the JFrog CLI target server  

    ```execute-2
    clear
    jfrog config add lab1 --url "$JFROG_PROTOCOL://$JFROG_URL" --access-token "$JFROG_ACCESSTOKEN" --overwrite --interactive=false
    ```

<br/>

3. List all environment configurations

  ```execute-2
  jfrog config show 
  ```

4. Ping the target server

  ```execute-2
  jfrog rt ping
  ```

<br/>

#### 2. JFrog CLI Plugins  

[Documentation](https://github.com/jfrog/jfrog-cli-plugins-reg)   

<br/>

1. Install a plugin  

  ```execute-2
  clear
  jfrog plugin install rt-fs
  ```

2. Invoke the plugin command  

  ```execute-2
  jfrog rt-fs ls default-generic-local
  ```

<br/>


---