###############################################################################################
##
## Test MetaStore for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8040/swagger-ui.html
HTTP 302

GET https://matwerk.datamanager.kit.edu:8040/swagger-ui/index.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "Swagger UI" # Check title
xpath "string(/html/body/div/@id)" == "swagger-ui" # Check title

## Test actuators
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8040/actuator/info
HTTP 200
[Asserts]
jsonpath "$.build.name" == "metastore2" # Check name
jsonpath "$.build.version" matches  "[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*" # Check for valid version (no snapshot)

GET https://matwerk.datamanager.kit.edu:8040/actuator/health
HTTP 200
[Asserts]
jsonpath "$.status" == "UP" # Check health status

## Test proxy
###############################################################################################
GET https://matwerk.datamanager.kit.edu/metastore/actuator/info
HTTP 200
[Asserts]
jsonpath "$.build.name" == "metastore2" # Check name
jsonpath "$.build.version" matches  "[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*" # Check for valid version (no snapshot)

## Test getting schema documents and landing page
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8040/api/v1/schemas/
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available schema

# Test old endpoint (may be deprecated in future)
GET https://matwerk.datamanager.kit.edu:8040/api/v1/schemas
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available schema
[Captures]
schema_id: jsonpath "$[0].schemaId"

GET https://matwerk.datamanager.kit.edu/metastore/api/v1/schemas/{{schema_id}}
Accept: text/html
HTTP 302
[Captures]
landing_url_schema: header "Location"
GET {{landing_url_schema}}
HTTP 200

## Test getting metadata documents and landing page
###############################################################################################
GET https://matwerk.datamanager.kit.edu/metastore/api/v1/metadata
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available metadata

# Test old endpoint (may be deprecated in future)
GET https://matwerk.datamanager.kit.edu/metastore/api/v1/metadata
HTTP 200
[Asserts]
jsonpath "$" count > 0 # Check for at least one public available metadata
[Captures]
metadata_id: jsonpath "$[0].id"

GET https://matwerk.datamanager.kit.edu/metastore/api/v1/metadata/{{metadata_id}}
Accept: text/html
HTTP 302
[Captures]
landing_url_metadata: header "Location"
GET {{landing_url_metadata}}
HTTP 200


## Test search
###############################################################################################
POST https://matwerk.datamanager.kit.edu/metastore/api/v1/search
{}
HTTP 200
[Asserts]
jsonpath "$.hits" exists # Check for hits
