###############################################################################################
##
## Test base-repo for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8090/swagger-ui.html
HTTP 302

GET https://matwerk.datamanager.kit.edu:8090/swagger-ui/index.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "Swagger UI" # Check title
xpath "string(/html/body/div/@id)" == "swagger-ui" # Check title

## Test actuators
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8090/actuator/info
HTTP 200
[Asserts]
jsonpath "$.build.name" == "base-repo" # Check name
jsonpath "$.build.version" matches  "[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*" # Check for valid version (no snapshot)

GET https://matwerk.datamanager.kit.edu:8090/actuator/health
HTTP 200
[Asserts]
jsonpath "$.status" == "UP" # Check health status

## Test proxy
###############################################################################################
GET https://matwerk.datamanager.kit.edu/baserepo/actuator/info
HTTP 200
[Asserts]
jsonpath "$.build.name" == "base-repo" # Check name
jsonpath "$.build.version" matches  "[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*" # Check for valid version (no snapshot)

## Test getting dataresources
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8090/api/v1/dataresources/
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available schema
[Captures]
dataresource_id: jsonpath "$[0].id"
GET https://matwerk.datamanager.kit.edu:8090/api/v1/dataresources/{{dataresource_id}}
HTTP 200


## Test getting dataresource and landing page
###############################################################################################
GET https://matwerk.datamanager.kit.edu/baserepo/api/v1/dataresources/
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available metadata
[Captures]
dataresource_id: jsonpath "$[0].id"

## Test getting landing page (Ask Thomas how to access landingpage.
## Maybe only via frontend available!?
###############################################################################################
#GET https://matwerk.datamanager.kit.edu/baserepo/api/v1/dataresources/{{dataresource_id}}
#Accept: text/html
#HTTP 302
#[Captures]
#landing_url_dataresource: header "Location"
#GET {{landing_url_dataresource}}
#HTTP 200


## Test search (not available with installed version (1.4.0))
###############################################################################################
#POST https://matwerk.datamanager.kit.edu/baserepo/api/v1/search
#{}
#HTTP 200
#[Asserts]
#jsonpath "$.hits" exists # Check for hits
