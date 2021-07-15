
<br/>

[Documentation](https://www.jfrog.com/confluence/display/JFROG/Using+File+Specs).

<br/>

File Specs can be used to specify a list of files, which can be then manipulated with Artifactory.

- Resolve dependencies

- Download artifacts based on software life cycle maturity

- Upload Third Party software to Artifactory

- Find latest artifacts

- Separation of File Specification from code

- Based on AQL

- Wildcard or regular expression with placeholders

<br/>


#### FileSpec JSON Format

```
{
 "files": [
   {
     "pattern" or "aql": "[Mandatory]",
     "target": "[Optional, Default: ./]",
     "props": "[Optional]",
     "recursive": "[Optional, Default: true]",
     "flat": "[Optional, Default: false]",
     "build": "[Optional]",
     "explode": "[Optional, Default: false]",
     "excludePatterns": ["[Optional]"]
   }
 ]
}
```

<br/>

---
