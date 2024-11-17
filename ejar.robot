*** Settings ***
Documentation  Smoke Testing for ejarmojservices
Resource   ../Resources/Common.robot
Resource   ../Resources/PO/login.robot
Resource   ../Resources/PO/ejarpage.robot
Resource   ../Resources/APIS/Ejarcontract.robot

Suite Setup  begin web test
Suite Teardown  end web test
*** Variables ***
${STG_BASEURL} =  https://ocpstg.moj.gov.local/auth/login
${Browser} =  chrome

*** Test Cases ***
#robot -d Result Test/ejarejar.robot
Verify that User can login OCP
   [Documentation]  log in with user has permistion ejarmoiservices
   [Tags]  Smoke
    login.go to login page
    login.fill element to login   aosama   1234
    login. verify otp  1234
    login. verify dicrect to home
Verify that Direct to ejar service
   [Documentation]  log in with user has permistion ejarmoiservices
   [Tags]  Smoke
  ejarpage.Direct to ejar page
Verify that page tittle correct ejar service
   [Documentation]  log in with user has permistion ejarmoiservices
   [Tags]  Smoke
   ejarpage.ejar service page tittle
Verify that page Containt ejar service
   [Documentation]  log in with user has permistion ejarmoiservices
   [Tags]  Smoke
   ejarpage.Validate Breadcrumb
Get Access Token and Fetch Contract Details
    [Documentation]    Retrieve an access token and fetch contract details
    ${token}=    Get Access Token
    # Set the parameters for the contract details request
    ${id_number}=    Set Variable    1040885046
    ${contract_number}=    Set Variable    300000304384
    ${major_version}=    Set Variable    1

    # Get contract details using the access token
    Get Contract Details    ${token}    ${id_number}    ${contract_number}    ${major_version}

*** Keywords ***


