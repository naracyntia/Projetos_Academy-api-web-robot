*** Settings ***

Library      Selenium2Library
Library      RequestsLibrary
Library      XML
Library      String
Library      libs/get_fake_person.py

Variables    ../fixtures/data.yaml
Variables    ../fixtures/ron_url.yaml
Variables    ../fixtures/thementalists_url.yaml

Resource     keywords.resource
Resource     users.resource
Resource     ../pages/pages_web.resource


*** Keywords ***


Abrir navegador
    Open Browser    browser=headlesschrome
    Maximize Browser Window


Passo 1 - acessar a página de login Qa.Coders Academy
    Go To      url=${env['ERPFront']} 


Passo 2 – digitar e-mail
    Wait Until Element Is Visible       ${emaillogin} 
    Input Text                          ${emaillogin}                ${USER}

Passo 3 – digitar senha
    Wait Until Element Is Visible       ${senhaInput}
    Input Password                      ${senhaInput}                ${PASSWORD}

Passo 4 – clicar no botão entrar
    Wait Until Element Is Visible       ${buttonEntrar}
    Click Button                        ${buttonEntrar}

Passo 5 – clicar em cadastro
    Wait Until Element Is Visible       ${cadastrolink}              3s
    Click Element                       ${cadastrolink}

Passo 6 – clicar em usuários
    Wait Until Element Is Visible       ${bottonusuarios}
    Click Element                       ${bottonusuarios}

Passo 7 – clicar em novo cadastro
    Wait Until Element Is Visible       ${buttonnovocadastro}         3s
    Click Element                       ${buttonnovocadastro}    

Passo 8 – digitar nome completo
    ${person}      Get Fake Person
    ${body}        Create Dictionary
    Wait Until Element Is Visible       ${NomecompletoInput}
    Input Text                          ${NomecompletoInput}          ${person}[name]

Passo 9 – digitar email
    ${person}      Get Fake Person
    ${body}        Create Dictionary
    Wait Until Element Is Visible       ${novoemailInput} 
    Input Text                          ${novoemailInput}             ${person}[email]

Passo 10 – digitar perfil de acesso
    Wait Until Element Is Visible       ${perfilacessoInput}
    Input Text                          ${perfilacessoInput}          Admin

Passo 11 - digitar cpf
    ${person}      Get Fake Person
    ${body}        Create Dictionary
    Wait Until Element Is Visible       ${cpfInput}
    Input Text                          ${cpfInput}                   ${person}[cpf]

Passo 12 – digitar senha
    Wait Until Element Is Visible       ${senhaInput}
    Input Password                      ${senhaInput}                 ${PASSWORD}

Passo 13 – confirmar senha
    Wait Until Element Is Visible       ${confirmesenhaInput}
    Input Password                      ${confirmesenhaInput}         ${PASSWORD}

Passo 14 – clicar no botão salvar
    Wait Until Element Is Visible       ${buttonsalvarnovo}
    Click Element                       ${buttonsalvarnovo}

Passo 6 – clicar em empresa
    Wait Until Element Is Visible        ${buttonempresa}             3s
    Click Element                        ${buttonempresa}

Passo 8 – digitar razão social
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Wait Until Element Is Visible        ${companyNameInput}
    Input Text                           ${companyNameInput}          ${Company}[nome_empresa]

Passo 9 – digitar nome fantasia
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Wait Until Element Is Visible        ${nomefantasiaInput}
    Input Text                           ${nomefantasiaInput}         ${Company}[nome_empresa] 

Passo 10 – digitar email
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Wait Until Element Is Visible        ${emailInput}
    Input Text                           ${emailInput}                ${Company}[email] 

Passo 11 - digitar cnpj
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Wait Until Element Is Visible        ${cnpjInput}
    Input Text                           ${cnpjInput}                 ${Company}[cnpj]

Passo 12 – digitar telefone
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Wait Until Element Is Visible        ${telefoneInput}
    Input Text                           ${telefoneInput}             ${Company}[telefone]

Passo 13 – digitar descrição
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${descricaoInput}
    Wait Until Element Is Visible        ${descricaoInput}            timeout=3s
    Input Text                           ${descricaoInput}            ${Company}[descricao]
    
Passo 14 – digitar nome do responsavel
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${responsavelInput}
    Wait Until Element Is Visible        ${responsavelInput}          timeout=3s
    Input Text                           ${responsavelInput}          ${Company}[responsavel]

Passo 15 – digitar cep
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${cepInput}
    Wait Until Element Is Visible        ${cepInput}                  timeout=3s
    Input Text                           ${cepInput}                  ${company}[zipCode]

Passo 16 - digitar país
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${paisInput}
    Wait Until Element Is Visible        ${paisInput}                 timeout=3s
    Input Text                           ${paisInput}                 ${company}[country]

Passo 17 – digitar cidade
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${cidadeInput}
    Wait Until Element Is Visible        ${cidadeInput}               timeout=3s
    Input Text                           ${cidadeInput}               ${company}[city]

Passo 18 – digitar estado
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${estadoInput}
    Wait Until Element Is Visible        ${estadoInput}               timeout=3s
    Input Text                           ${estadoInput}               ${company}[state]

Passo 19 – digitar bairro
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${bairroInput}
    Wait Until Element Is Visible        ${bairroInput}               timeout=3s
    Input Text                           ${bairroInput}               ${company}[district]

Passo 20 - digitar rua
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${ruaInput}
    Wait Until Element Is Visible        ${ruaInput}                  timeout=3s
    Input Text                           ${ruaInput}                  ${company}[street]

Passo 21 - digitar numero do imovel
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${numeroInput}
    Wait Until Element Is Visible        ${numeroInput}               timeout=3s
    Input Text                           ${numeroInput}               ${company}[number]

Passo 22 - digitar complemento
    Passo 21 - digitar numero do imovel
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${complementoInput}
    Wait Until Element Is Visible        ${complementoInput}          timeout=3s
    Input Text                           ${complementoInput}          casa 3201

Passo 23 - clicar no botao salvar
    ${Company}       Get Fake Company
    ${bodyCia}       Create Dictionary
    Scroll Element Into View             ${buttonsalvarnovo}
    Wait Until Element Is Visible        ${buttonsalvarnovo}          3s
    Click Element                        ${buttonsalvarnovo} 
                  

Passo 7.1 - clicar em editar
    ${person}      Get Fake Person
    ${body}        Create Dictionary
    Wait Until Element Is Visible       ${bottoneditar}
    Click Button                        ${bottoneditar}    
    Input Text                          ${NomecompletoInput}          ${person}[name]

Passo 10 – clicar no botão salvar alteração
    Wait Until Element Is Visible       ${salvaralteracoes}
    Click Button                        ${salvaralteracoes}
    
Passo 7 - clicar em pesquisar
    Wait Until Element Is Visible       ${campopesquisar}
    Input Text                          ${campopesquisar}             ADMIN




# Fechar navegador
#     Close Browser      