*** Settings ***
Resource      ../../resources/company.resource
Resource      ../../resources/web.resource

Test Setup        Abrir navegador
#Test Teardown     Fechar navegador

*** Test Cases ***
Cenário de Post: Cadastro de empresa
    [Tags]    post
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em empresa
    Passo 7 – clicar em novo cadastro
    Passo 8 – digitar razão social
    Passo 9 – digitar nome fantasia
    Passo 10 – digitar email
    Passo 11 - digitar cnpj
    Passo 12 – digitar telefone
    Passo 13 – digitar descrição
    Passo 14 – digitar nome do responsavel
    Passo 15 – digitar cep
    Passo 16 - digitar país
    Passo 17 – digitar cidade
    Passo 18 – digitar estado
    Passo 19 – digitar bairro
    Passo 20 - digitar rua
    Passo 21 - digitar numero do imovel
    Passo 22 - digitar complemento
    Passo 23 - clicar no botao salvar
      
Cenário de PUT: Editar empresa
    [Tags]    put
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em empresa
    Passo 7.1 - clicar em editar
    Passo 8 – digitar razão social
    Passo 9 – digitar nome fantasia
    Passo 10 – digitar email
    Passo 11 - digitar cnpj
    Passo 12 – digitar telefone
    Passo 13 – digitar descrição
    Passo 14 – digitar nome do responsavel
    Passo 15 – digitar cep
    Passo 16 - digitar país
    Passo 17 – digitar cidade
    Passo 18 – digitar estado
    Passo 19 – digitar bairro
    Passo 20 - digitar rua
    Passo 21 - digitar numero do imovel
    Passo 22 - digitar complemento
    Passo 23 - clicar no botao salvar

Cenário de GET: Editar empresa
    [Tags]    get
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em empresa
    Passo 7 - clicar em pesquisar
    

         
  #66fdeaa4eed30dc911c018e9



