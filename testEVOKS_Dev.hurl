###############################################################################################
##
## Test EVOKS_dev for MatWerk
##
###############################################################################################
## Test for accessibility of all html files
###############################################################################################
GET http://matwerk.datamanager.kit.edu:8000/
HTTP 302

GET http://matwerk.datamanager.kit.edu:8000/index.html
HTTP 200

GET http://matwerk.datamanager.kit.edu:8000/login
HTTP 200
[Asserts]
xpath "string(/html/head/title)" == "Log in"       # Check title
