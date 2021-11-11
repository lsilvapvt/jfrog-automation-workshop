<!-- Webhooks management -->

<br/>

[Documentation](https://www.jfrog.com/confluence/display/JFROG/Webhooks).

<br/>


1. **Get All Webhooks Subscriptions** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GettheListofallWebhookSubscriptions)):  

  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/event/api/v1/subscriptions
  ```
  
2. **Create a New Webhook Subscription** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-CreateaNewWebhookSubscription)):  

  First, to test the webhook, create a sample webhook with webhook.site:
  ```dashboard:open-url
  name: Webhook.site
  url: https://webhook.site
  ```

  Copy the provided test webhook URL from the webhook.site page, edit the webhook configuration file's and then update the `url` field with that value:
  ```editor:open-file
  file: ./files/webhooks/webhook_artifact.json
  line: 23
  ``` 
 
  Finally, create the webhook subscription using the updated configuration file:
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/event/api/v1/subscriptions -H "Content-Type: application/json" -d @$HOME/files/webhooks/webhook_artifact.json
  ```


3. **Get a Webhook Subscription by Key** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-GetaWebhookSubscriptionbyKey)):
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X GET $JFROG_PROTOCOL://$JFROG_URL/event/api/v1/subscriptions/notify_of_local_artifact_change
  ```

4. **Test Webhook Subscription** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-TestWebhookSubscription)):
  
  Trigger a test webhook event:  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X POST $JFROG_PROTOCOL://$JFROG_URL/event/api/v1/subscriptions/test -H "Content-Type: application/json" -d @$HOME/files/webhooks/webhook_artifact.json
  ``` 

  Then go to the webhook.site page opened in step (1) above to verify that the triggered test event(s) were received. 

5. **Delete Webhook Subscription by Key** ([api](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-DeleteWebhookSubscriptionbyKey)):
  
  ```execute
  curl -H "Authorization: Bearer $JFROG_ACCESSTOKEN" -X DELETE $JFROG_PROTOCOL://$JFROG_URL/event/api/v1/subscriptions/notify_of_local_artifact_change
  ```

---
