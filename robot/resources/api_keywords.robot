*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

*** Variables ***
${API_BASE}    %{API_BASE=https://guibim.github.io/btcheck}

*** Keywords ***
Criar Sessão API
    Create Session    btcheck    ${API_BASE}    disable_warnings=${True}

Endpoint Deve Retornar 200 E JSON
    [Arguments]    ${endpoint}
    ${resp}=    GET On Session    btcheck    ${endpoint}
    Should Be Equal As Integers    ${resp.status_code}    200
    ${body}=    Evaluate    $resp.json()
    [Return]    ${body}
