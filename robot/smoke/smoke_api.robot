*** Settings ***
Resource    ../resources/api_keywords.robot
Suite Setup    Criar Sessão API
Test Tags      smoke    api

*** Test Cases ***
/news.json Deve Responder E Conter Lista
    ${body}=    Endpoint Deve Retornar 200 E JSON    /news.json
    Dictionary Should Contain Key    ${body}    items
    ${count}=    Evaluate    len($body["items"])
    Should Be True    ${count} > 0

/btc_price.json Deve Responder E Conter Campos Principais
    ${body}=    Endpoint Deve Retornar 200 E JSON    /btc_price.json
    # Campos básicos
    Dictionary Should Contain Key    ${body}    updated_at
    Dictionary Should Contain Key    ${body}    source
    Dictionary Should Contain Key    ${body}    prices
    # Extrai USD/BRL de estruturas conhecidas (inclui seu formato atual)
    ${usd}=    _Extrair USD    ${body}
    ${brl}=    _Extrair BRL    ${body}
    _Assert Numero Positivo    ${usd}    usd
    _Assert Numero Positivo    ${brl}    brl

*** Keywords ***
_Assert Numero Positivo
    [Arguments]    ${valor}    ${campo}
    Log    Validando ${campo}: ${valor}
    Should Be True    isinstance(${valor}, (int, float))
    Should Be True    ${valor} > 0

_Extrair USD
    [Arguments]    ${body}
    # Suporta vários formatos: {usd}, {price: {usd}}, {prices: {BTC_USD}}, {USD}, {price_usd}
    Run Keyword If    'usd' in $body                 Return From Keyword    ${body['usd']}
    Run Keyword If    'price' in $body and 'usd' in $body['price']    Return From Keyword    ${body['price']['usd']}
    Run Keyword If    'USD' in $body                 Return From Keyword    ${body['USD']}
    Run Keyword If    'price_usd' in $body           Return From Keyword    ${body['price_usd']}
    Run Keyword If    'prices' in $body and 'BTC_USD' in $body['prices']    Return From Keyword    ${body['prices']['BTC_USD']}
    Fail    Não foi possível extrair USD. Chaves disponíveis: ${body.keys()}

_Extrair BRL
    [Arguments]    ${body}
    Run Keyword If    'brl' in $body                 Return From Keyword    ${body['brl']}
    Run Keyword If    'price' in $body and 'brl' in $body['price']    Return From Keyword    ${body['price']['brl']}
    Run Keyword If    'BRL' in $body                 Return From Keyword    ${body['BRL']}
    Run Keyword If    'price_brl' in $body           Return From Keyword    ${body['price_brl']}
    Run Keyword If    'prices' in $body and 'BTC_BRL' in $body['prices']    Return From Keyword    ${body['prices']['BTC_BRL']}
    Fail    Não foi possível extrair BRL. Chaves disponíveis: ${body.keys()}
