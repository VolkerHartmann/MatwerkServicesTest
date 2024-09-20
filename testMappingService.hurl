###############################################################################################
##
## Test mapping service for MatWerk
##
###############################################################################################
## Test for accessibility of administration
###############################################################################################
GET https://matwerk.datamanager.kit.edu:8095/api/v1/mappingAdministration
HTTP 200

[Asserts]
jsonpath "$" count > 5 # Check for at least 6 public available mappings
jsonpath "$[*].mappingId" includes "SEMTomoToTxt" # Check for special mapping
jsonpath "$[*].mappingId" includes "SEMTomoToJSON" # Check for special mapping
jsonpath "$[*].mappingId" includes "TF-FEI2JSON" # Check for special mapping
jsonpath "$[*].mappingId" includes "SEM2CSV" # Check for special mapping
jsonpath "$[*].mappingId" includes "MRI_DICOM_to_JSON" # Check for special mapping
jsonpath "$[*].mappingId" includes "SEMtoJSON15022024" # Check for special mapping

