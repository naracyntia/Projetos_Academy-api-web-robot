*** Settings ***
Documentation    Keywords para o PATH /board

Resource         keywords.resource


*** Keywords ***
Criar Board
    ${board}           Get Fake Board
    ${token}           Pegar Token
    ${body}            Create Board
    Log To Console     ${body}


List Board
    [Documentation]     Retorna a listagem de diretorias
    ${token}            Pegar Token
    ${resposta}         GET On Session     alias=APISwagger       url=board/?token=${token}
    Status Should Be    200                ${resposta}
    RETURN              ${resposta.json()}


Count Board
    ${token}            Pegar Token
    ${resposta}         GET On Session     alias=APISwagger       url=board/count?token=${token}
    RETURN              ${resposta.json()}

Get Board    
    [Arguments]         ${BOARD_ID}
    ${token}            Pegar Token
    ${resposta}         GET On Session      alias=APISwagger      url=board/${BOARD_ID}?token=${token}
    RETURN              ${resposta.json()}
   

Editar Board
    ${board}            Get Fake Board
    ${token}            Pegar Token
    ${body}             Create Dictionary    
    
    ...    boardName=${board}
    
    ${resposta}          PUT On Session      alias=APISwagger     url=board/${BOARD_ID}?token=${token}    json=${body}
    RETURN               ${resposta.json()}



