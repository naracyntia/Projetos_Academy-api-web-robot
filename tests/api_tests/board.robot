*** Settings ***

Resource        ../../resources/board.resource


*** Test Cases ***
Criar diretoria com sucesso
    ${BOARD_ID}            Create Board
  
  
Pegar uma diretoria por ID
    ${BOARD_ID}            keywords.Create Board
    Get     Board          ${BOARD_ID}


Listagem de diretorias com sucesso
    ${list_boards}          List Board
    Log                     ${list_boards}
    Should Be String        ${list_boards[0]['_id']}
    Should Not Be Empty     ${list_boards}


Contagem de diretorias com sucesso
    ${count_board}          Count Board
    Should Not Be Empty     ${count_board}


Atualizar nome da diretoria
    ${BOARD_ID}             keywords.Create Board
    ${resposta}             Put     boardName       ${BOARD_ID}          ${board}      
    Should Be String        msg=Cadastro atualizado com sucesso.         item=${resposta["msg"]}
    Log                     message=${resposta["msg"]}
    Delete                  Board                   id_board=${BOARD_ID}