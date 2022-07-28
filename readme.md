
# gcp 1.0

Google Cloud CLI

---
- #### Categories: cloud, build
- #### Image: gcr.io/direktiv/apps/gcp 
- #### License: [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
- #### Issue Tracking: https://github.com/direktiv-apps/gcp/issues
- #### URL: https://github.com/direktiv-apps/gcp
- #### Maintainer: [direktiv.io](https://www.direktiv.io) 
---

## About gcp

This function provides Google Cloud's command line interface version 395.0.0. It has `gscloud` and `gsutil` installed.  Please make sure to append `--format=json` if a JSON response of a command is required. 

### Example(s)
  #### Function Configuration
```yaml
functions:
- id: gcp
  image: gcr.io/direktiv/apps/gcp:1.0
  type: knative-workflow
```
   #### Basic
```yaml
- id: gcp
  type: action
  action:
    function: gcp
    secrets: ["gcpJSONKey", "gcpProject", "gcpAccount"]
    input: 
      account: jq(.secrets.gcpAccount)
      project: jq(.secrets.gcpProject)
      key: jq(.secrets.gcpJSONKey)
      commands:
      - command: gcloud compute instances list --format=json
```

   ### Secrets


- **gcpJSONKey**: Google Cloud service account JSON keyfile, base64 encoded. The file should not have line wraps, e.g. 'base -w 0' on Linux.
- **gcpProject**: Google Cloud project
- **gcpAccount**: Google Cloud service account






### Request



#### Request Attributes
[PostParamsBody](#post-params-body)

### Response
  List of executed commands.
#### Reponse Types
    
  

[PostOKBody](#post-o-k-body)
#### Example Reponses
    
```json
[
  {
    "result": {
      "canIpForward": false,
      "confidentialInstanceConfig": {
        "enableConfidentialCompute": false
      },
      "cpuPlatform": "Unknown CPU Platform"
    },
    "success": true
  }
]
```

### Errors
| Type | Description
|------|---------|
| io.direktiv.command.error | Command execution failed |
| io.direktiv.output.error | Template error for output generation of the service |
| io.direktiv.ri.error | Can not create information object from request |


### Types
#### <span id="post-o-k-body"></span> postOKBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| gcp | [][PostOKBodyGcpItems](#post-o-k-body-gcp-items)| `[]*PostOKBodyGcpItems` |  | |  |  |


#### <span id="post-o-k-body-gcp-items"></span> postOKBodyGcpItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| result | [interface{}](#interface)| `interface{}` | ✓ | |  |  |
| success | boolean| `bool` | ✓ | |  |  |


#### <span id="post-params-body"></span> postParamsBody

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| account | string| `string` | ✓ | | Google Cloud service account name | `myserviceaccount@myproject.iam.gserviceaccount.com` |
| commands | [][PostParamsBodyCommandsItems](#post-params-body-commands-items)| `[]*PostParamsBodyCommandsItems` |  | | Array of commands. |  |
| files | [][DirektivFile](#direktiv-file)| `[]apps.DirektivFile` |  | | File to create before running commands. |  |
| key | string| `string` | ✓ | | Google Cloud JSON key base64 encoded | `L05ZXG4wTjJSZXQ2NGdYblc0c201a3hZV1R2MFFObnN2V2Vqc1==` |
| project | string| `string` | ✓ | | Google Cloud project name |  |


#### <span id="post-params-body-commands-items"></span> postParamsBodyCommandsItems

  



**Properties**

| Name | Type | Go type | Required | Default | Description | Example |
|------|------|---------|:--------:| ------- |-------------|---------|
| command | string| `string` |  | | Command to run | `gcloud compute instances list --format=json` |
| continue | boolean| `bool` |  | | Stops excecution if command fails, otherwise proceeds with next command |  |
| print | boolean| `bool` |  | `true`| If set to false the command will not print the full command with arguments to logs. |  |
| silent | boolean| `bool` |  | | If set to false the command will not print output to logs. |  |

 
