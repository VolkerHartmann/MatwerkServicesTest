###############################################################################################
##
## Test Documentation for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET https://matwerk.datamanager.kit.edu/docs/
HTTP 200
[Asserts]
xpath "string(/html/head/title)" contains "MatWerk Docs" # Check title

