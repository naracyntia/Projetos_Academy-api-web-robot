*** Settings ***
Documentation    Keywords para o PATH /Users

Resource         keywords.resource


*** Keywords ***
    
List Users
    [Documentation]     Retorna a listagem de usuários
    ${token}            Pegar Token
    ${resposta}         GET On Session    alias=APISwagger    url=/user/?token=${token}
    Status Should Be    200    ${resposta}
    RETURN                     ${resposta.json()}

Criar usuário
    ${person}       Get Fake Person
    ${token}        Pegar Token
    ${body}         Create User
       
    
Count Users
    ${token}       Pegar Token
    ${resposta}    GET On Session    alias=APISwagger    url=/user/count?token=${token}
    RETURN         ${resposta.json()}

Get User
    [Arguments]     ${id_user}
    ${token}        Pegar Token
    ${resposta}     GET On Session    alias=APISwagger    url=/user/${id_user}?token=${token}
    Log             ${resposta.json()["_id"]}

Delete User
    [Arguments]          ${id_user}
    ${token}             Pegar Token
    DELETE On Session    alias=APISwagger    url=/user/${id_user}?token=${token}

Put Status
    [Arguments]     ${id_user}           ${status}
    ${token}        Pegar Token
    ${body}         Create Dictionary    status=${status}
    ${resposta}     PUT On Session       alias=APISwagger     url=/user/status/${id_user}?token=${token}    json=${body}
    RETURN          ${resposta.json()}

Cadastro Sucesso
    ${user_ID}      Create User
    Get User        ${user_ID}
    Delete User     id_user=${user_ID}
