*** Settings ***
Documentation    Keywords para o PATH /Company

Resource         keywords.resource


*** Keywords ***
List Company
    [Documentation]     Retorna a listagem de empresas
    ${token}            Pegar Token
    ${resposta}         GET On Session    alias=APISwagger    url=company/?token=${token}
    Status Should Be    200    ${resposta}
    RETURN                     ${resposta.json()}


Criar Company
    ${company}         Get Fake Company
    ${token}           Pegar Token
    ${body}            Create Company
    Log To Console     ${body}


Count Company
    ${token}           Pegar Token
    ${resposta}        GET On Session     alias=APISwagger    url=company/count?token=${token}
    RETURN             ${resposta.json()}

Get Company    
    [Arguments]        ${company_ID}
    ${token}           Pegar Token
    ${resposta}        GET On Session     alias=APISwagger    url=company/${company_ID}?token=${token}
    Log                ${resposta.json()["_id"]}


Delete Company
    [Arguments]          ${company_ID}
    ${token}             Pegar Token
    DELETE On Session    alias=APISwagger    url=company/${company_ID}?token=${token}


Put Status
    [Arguments]         ${company_ID}           ${status}
    ${token}            Pegar Token
    ${body}             Create Dictionary    status=${status}
    ${resposta}         PUT On Session       alias=APISwagger     url=company/status/${company_ID}?token=${token}    json=${body}
    RETURN              ${resposta.json()}


Cadastro Sucesso
    ${company_ID}       Create Company
    Get Company         ${company_ID}
    Delete Company      id_company=${company_ID}


Editar Company
    ${company}          Get Fake Company
    ${token}            Pegar Token
    ${address}          Create Dictionary
    ...    zipCode=${company}[zipCode]
    ...    city=${company}[city]
    ...    state=RJ
    ...    district=Lagoa
    ...    street=Rua Lopes Quintas
    ...    number=123
    ...    complement=casa 3 ap 201
    ...    country=${company}[country]
  
    ${address}    Create List    ${address}
      
    ${body}       Create Dictionary    
    ...    corporateName=${Company}[nome_empresa]
    ...    registerCompany=${Company}[cnpj]
    ...    mail=${Company}[email]
    ...    matriz=Teste
    ...    responsibleContact=Nara 
    ...    telephone=${Company}[telefone]
    ...    serviceDescription=Desenvolvimento
    ...    address=${address}


    ${resposta}           PUT On Session    alias=APISwagger    url=company/address/${company_ID}?token=${token}    json=${body}
    log to Console        ${resposta.json()}
    RETURN                ${resposta.json()}
    
Cadastar empresa campo cnpj vazio
    ${company}        Get Fake Company
    ${TOKEN}          Pegar Token
    ${address}        Create Dictionary
    ...    zipCode=${company}[zipCode]
    ...    city=${company}[city]
    ...    state=RJ
    ...    district=Lagoa
    ...    street=Rua Lopes Quintas
    ...    number=123
    ...    complement=casa 3 ap 201
    ...    country=${company}[country]
  
    ${address}    Create List    ${address}
    ${body}       Create Dictionary    
    ...    corporateName=${Company}[nome_empresa]
    ...    registerCompany=" "
    ...    mail=${Company}[email]
    ...    matriz=Teste
    ...    responsibleContact=Nara 
    ...    telephone=${Company}[telefone]
    ...    serviceDescription=Desenvolvimento
    ...    address=${address} 
  
    Log                  ${body}
    ${resposta}          POST On Session        alias=APISwagger    url=company/?token=${token}    json=${body}    expected_status=400
    Log                  ${resposta.json()}
    Set Test Variable    ${RESPOSTA}            ${resposta.json()}
    RETURN               ${RESPOSTA} 

Validar Id inesistente   
    [Arguments]          ${company_ID}
    ${token}             Pegar Token
    ${resposta}          GET On Session         alias=APISwagger    url=company/${company_ID}?token=${token}    expected_status=400
    Set Test Variable    ${RESPOSTA}            ${resposta.json()}
    RETURN               ${RESPOSTA}



