*** Settings ***
Documentation        Arquivo das Bibliotecas

Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Library      libs/get_fake_person.py



*** Variables ***
${baseUrl}          https://ron-bugado.qacoders.dev.br/api
${id_user}          661c585d14ff021dc447c556
${MSG}              Endereço da companhia atualizado com sucesso! 
${Url_web}          https://automacao.qacoders.dev.br/login  




*** Keywords ***
Criar Sessao
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json    
    Create Session    alias=APISwagger    url=${baseUrl}    headers=${headers}    verify=true

Pegar Token
    ${body}    Create Dictionary    
    ...    mail=sysadmin@qacoders.com    
    ...    password=1234@Test
    Log    ${body}
    Criar Sessao
    ${resposta}    POST On Session    alias=APISwagger    url=/login    json=${body}
    Status Should Be    200    ${resposta}
    RETURN                     ${resposta.json()["token"]}


Create User
    ${person}      Get Fake Person
    ${token}       Pegar Token
    ${body}        Create Dictionary
    ...    fullName=${person}[name]    
    ...    mail=${person}[email]
    ...    password=1234@Test
    ...    accessProfile=ADMIN
    ...    cpf=${person}[cpf]
    ...    confirmPassword=1234@Test
    ${resposta}         POST On Session    alias=APISwagger    url=/user/?token=${token}    json=${body}
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
    
    Log To Console     Criando empresa com dados: ${bodyCia}
    ${resposta}           POST On Session    alias=APISwagger    url=/company/?token=${token}      json=${bodyCia}
    RETURN    ${resposta.json()["newCompany"]["_id"]}
    log to Console          ${resposta.json()}
    ${company_ID}    Set Test Variable    ${resposta.json()["newCompany"]["_id"]}
    RETURN         ${company_ID}
    









