*** Settings ***
Resource    ../../resources/company.resource


*** Variables ***
${CEPS_FILE_PATH}    fixtures/ceps.txt

*** Test Cases ***
Criar empresa 
    Cadastro Sucesso

Pegar ID da empresa
    ${company_ID}             Keywords.Create Company
    Get Company               ${company_ID}


Listagem de empresas com sucesso
    ${list_company}           List Company
    Log                       ${list_Company}
    Should Be String          ${list_Company[0]['_id']}
    Should Not Be Empty       ${list_Company}

Contagem de empresas com sucesso
    ${count_company}          Count Company
    Should Not Be Empty       ${count_company}

Atualizar Status para False
    ${company_ID}             Keywords.Create Company
    ${resposta}               Put Status               ${company_ID}         status=false
    Log                       message=${resposta["msg"]}
    Should Be Equal           Status da companhia atualizado com sucesso.    ${resposta["msg"]}
    Delete Company            id_company=${company_ID}


Atualizar Status para True
    ${company_ID}             Keywords.Create Company
    ${resposta}               Put Status               ${company_ID}          status=true
    Should Be String          msg=Status da companhia atualizado com sucesso.    item=${resposta["msg"]}
    Log                       message=${resposta["msg"]}
    Delete Company            id_company=${company_ID}


Editar endereço com sucesso
    ${resposta}               Editar Company
    Should Be String          msg=${MSG}                item=${resposta["msg"]}
    Log                       message=${resposta["msg"]}
   
    
Criar empresa com campo vazio
    Cadastar empresa campo cnpj vazio
    ${resposta}               Cadastar empresa campo cnpj vazio
    

Validar Id de empresa inesistente
    Validar Id inesistente    id_company=66fdeaa4eed30dc911c018e9
    ${resposta}               Validar Id inesistente             id_company=66fdeaa4eed30dc911c018e9
      
   

