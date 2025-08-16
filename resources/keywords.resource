*** Settings ***
Documentation        Arquivo das Bibliotecas


Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Library      ../tests/get_config.py
Library      ../resources/libs/get_fake_person.py


Variables     ../fixtures/data.yaml
Variables     ../fixtures/env.yaml     


*** Variables ***
${id_user}           661c585d14ff021dc447c556
${MSG}               Endereço da companhia atualizado com sucesso! 
            


*** Keywords ***
Criar Sessao
    ${env}             get environment
    ${headers}         Create Dictionary    accept=application/json    Content-Type=application/json         
    Create Session     alias=APISwagger     url=${environments["${env}"]['Swagger']}      headers=${headers}    verify=true

Pegar Token
    ${body}    Create Dictionary    
    ...    mail=${Login.USER}
    ...    password=${Login.PASSWORD}
    Log    ${body}
    Criar Sessao
    ${resposta}                POST On Session    alias=APISwagger    url=login/    json=${body}   
    Status Should Be           200         ${resposta}
    Set Test Variable          ${Token}    ${resposta.json()["token"]}
    RETURN                     ${resposta.json()["token"]}
    Log                        ${Token}         

Create User
    ${person}      Get Fake Person
    ${token}       Pegar Token
    ${body}        Create Dictionary
    ...    fullName=${person}[name]    
    ...    mail=${person}[email]
    ...    password=${Login["PASSWORD"]}
    ...    accessProfile=ADMIN
    ...    cpf=${person}[cpf]
    ...    confirmPassword=${Login["PASSWORD"]}
    ${resposta}         POST On Session    alias=APISwagger    url=user/?token=${token}    json=${body}
    Status Should Be    201    ${resposta}
    RETURN                     ${resposta.json()["user"]["_id"]}



Create Company
    ${Company}         Get Fake Company
    ${token}           Pegar Token
  
    ${address}         Create Dictionary
    ...    zipCode=${Company}[zipCode]
    ...    city=${Company}[city]
    ...    state=${Company}[state]
    ...    district=${Company}[district]
    ...    street=${Company}[street]
    ...    number=${Company}[number]
    ...    complement=casa 3 ap 201
    ...    country=${Company}[country]

    ${address}       Create List    ${address}
      
    ${bodyCia}       Create Dictionary    
    ...    corporateName=${Company}[nome_empresa]
    ...    registerCompany=${Company}[cnpj]
    ...    mail=${Company}[email]
    ...    matriz=Teste
    ...    responsibleContact=${Company}[responsavel] 
    ...    telephone=${Company}[telefone]
    ...    serviceDescription=${Company}[descricao]
    ...    address=${address}
    
   
    ${resposta}         POST On Session              alias=APISwagger    url=company/?token=${token}      json=${bodyCia}
    RETURN              ${resposta.json()["newCompany"]["_id"]}
    log to Console      ${resposta.json()}
    ${company_ID}       Set Test Variable            ${resposta.json()["newCompany"]["_id"]}
    RETURN              ${company_ID}
    


Create Board
    ${board}       Get Fake Board
    ${token}       Pegar Token
    ${body}        Create Dictionary
    ...    boardName=${board}    
    
    ${resposta}         POST On Session    alias=APISwagger    url=board/?token=${token}    json=${body}
    Status Should Be    201                ${resposta}
    ${BOARD_ID}=        Set Variable       ${resposta.json()["newBoard"]["_id"]}
    RETURN                                 ${resposta.json()["newBoard"]["_id"]}






