<br/>

The JFrog CLI Can be [downloaded](https://jfrog.com/getcli/) and installed on multiple clients.

It is a smart client with a simple interface to JFrog products

- Aimed for automation and for simplifying automation scripts by making your scripts more efficient, reliable and maintainable. 

#### Advantages:  

  - High level functionality (Parallelism, resumability, wildcards, etc.)  
  - Checksum awareness  
  - Multiple configurations support  
  - Simulation mode  
  - CLI Plugins supported ([link](https://github.com/jfrog/jfrog-cli-plugins-reg))  


### JFrog CLI Syntax

`jfrog  target  command-name  global-options  command-options  arguments`

Possible Targets:

```
   rt          Artifactory commands
   bt          Bintray commands
   mc          Mission Control commands
   xr          Xray commands
```

Command to execute:

```
  config
  upload & download
  copy, move, delete
  search & properties
  build integration
  create release bundle
  ...
```

Global Options:
```
  --url
  --user
  --password
  --ssh-key-path
```

Command options:
```
  --props
  --recursive
  --regexp
  --threads
  --dry-run
  --deb
```

---

#### References

- [JFrog CLI documentation](https://www.jfrog.com/confluence/display/CLI/JFrog+CLI)

---

