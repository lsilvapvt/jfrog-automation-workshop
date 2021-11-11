# Team security onboarding sample script

This folder contains a set of scripts and configuration files to demonstrate the automation of creating XRay policies and watches in a bulk fashion (that can be integrated into a CI tool pipeline).

---

#### How To Run It

1. Setup the environment

  To setup the Artifactory demonstration environment, run `01_prep_test_env.sh` after doing the `PRE_REQ` steps listed in the file itself. 
 
  The script will create two repositories in the targeted JFrog Platform instance: `acmeco-generic-dev-local` and `acmeco-generic-prod-local`.  
  It will also create a generic XRay Security Policy called `acmeco_security_policy`.


2. Create Watches for multiple teams

A list of sample teams and services to onboard is defined in `teams.txt` (which could be stored in a git repository or be provided by an external system such as ServiceNow). Update the contents of the file as needed.

Run `02_onboard_teams.sh` to create XRay watches for each team. 

The created watches will have names that follow this pattern: `acmeco_<TEAMNAME>_<TEAM_SUBFOLDER>_watch` and will be linked to the security policy and with the corresponding sub-folder of the Dev repository both created in step (1) above.

---

### Clean up of demo environent 

Run `99_cleanup_items.sh` to remove all entities created by steps (1) and (2) above. 

---
