###############################################################################################
##
## Test frontend for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET https://matwerk.datamanager.kit.edu
HTTP 200

## Test forwards due to referenced in external documents
###############################################################################################
GET https://matwerk.datamanager.kit.edu/index.html
HTTP 200
[Asserts]
xpath "string(/html/head/meta/@content)" contains "/frontend/dashboard.html" # Check forward

GET https://matwerk.datamanager.kit.edu/dashboard.html
HTTP 200
[Asserts]
xpath "string(/html/head/meta/@content)" contains "/frontend/dashboard.html" # Check forward

GET https://matwerk.datamanager.kit.edu/repo-management.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/schema-management.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/mapping-service-ui.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/metadata-management.html
HTTP 200

## Test for documentation
###############################################################################################
GET https://matwerk.datamanager.kit.edu/docs/
HTTP 200

## Test for frontend
###############################################################################################
GET https://matwerk.datamanager.kit.edu/frontend/index.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/dashboard.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/repo-management.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "BaseRepo UI" # Check title

GET https://matwerk.datamanager.kit.edu/frontend/schema-management.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MetaStore2 UI" # Check title

GET https://matwerk.datamanager.kit.edu/frontend/mapping-service-ui.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "Mapping Service UI" # Check title

GET https://matwerk.datamanager.kit.edu/frontend/metadata-management.html
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MetaStore2 UI" # Check title

GET https://matwerk.datamanager.kit.edu/frontend/elastic-search-base-repo.html
HTTP 200
GET https://matwerk.datamanager.kit.edu/react-search/index.html
HTTP 200

## Check settings for frontend
###############################################################################################
GET https://matwerk.datamanager.kit.edu/frontend/settings/general.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/base-repo.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/dashboard.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/elastic-search-base-repo.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/elastic-search-metastore.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/metastore.settings.js
HTTP 200
GET https://matwerk.datamanager.kit.edu/frontend/settings/mapping-service.settings.js
HTTP 200
