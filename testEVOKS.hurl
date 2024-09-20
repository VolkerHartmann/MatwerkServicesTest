###############################################################################################
##
## Test EVOKS for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET http://matwerk.datamanager.kit.edu:8001/
HTTP 302

GET https://matwerk.datamanager.kit.edu/evoks
HTTP 302

GET http://matwerk.datamanager.kit.edu:8001/de/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk"       # Check title
xpath "count(//select/option)" >= 4                 # Check the number vocabularies
xpath "string(//select)" contains "DemoTerms"       # Check for special vocabulary
xpath "string(//select)" contains "MatWerkAcronyms" # Check for special vocabulary

GET http://matwerk.datamanager.kit.edu:8001/en/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk" # Check title

GET https://matwerk.datamanager.kit.edu/evoks/de/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk" # Check title

GET https://matwerk.datamanager.kit.edu/evoks/en/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk" # Check title


## Test vocabulara MatWerkAcronyms-1
###############################################################################################
GET https://matwerk.datamanager.kit.edu/evoks/en/MatWerkAcronyms-1/de/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk" # Check title

## Test vocabulara DemoTerms-1
###############################################################################################
GET https://matwerk.datamanager.kit.edu/evoks/en/DemoTerms-1/de/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "MatWerk" # Check title
