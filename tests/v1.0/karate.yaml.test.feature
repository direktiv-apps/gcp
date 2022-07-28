
Feature: Basic

# The secrects can be used in the payload with the following syntax #(mysecretname)
Background:
* def gcpJSONKey = karate.properties['gcpJSONKey']
* def gcpProject = karate.properties['gcpProject']


Scenario: get request

	Given url karate.properties['testURL']

	And path '/'
	And header Direktiv-ActionID = 'development'
	And header Direktiv-TempDir = '/tmp'
	And request
	"""
	{	
		"project": "#(gcpProject)",
		"key": "#(gcpJSONKey)",
		"commands": [
		{
			"command": "gcloud compute instances list --format=json",
			"silent": true,
			"print": false,
		}
		]
	}
	"""
	When method POST
	Then status 200
	And match $ ==
	"""
	{
	"gcp": [
	{
		"result": "#notnull",
		"success": true
	}
	]
	}
	"""
	