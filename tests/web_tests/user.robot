*** Settings ***
Resource          ../../resources/web.resource
Test Setup        Abrir navegador
#Test Teardown     Fechar navegador

*** Test Cases ***
Cenário de Post: Cadastro de usuário
    [Tags]    post
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em usuários
    Passo 7 – clicar em novo cadastro
    Passo 8 – digitar nome completo
    Passo 9 – digitar email
    Passo 10 – digitar perfil de acesso
    Passo 11 - digitar cpf
    Passo 12 – digitar senha
    Passo 13 – confirmar senha
    Passo 14 – clicar no botão salvar

Cenário de PUT: Editar usuário
    [Tags]    put
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em usuários
    Passo 7.1 - clicar em editar
    Passo 8 – digitar nome completo
    Passo 9 – digitar email
    Passo 10 – clicar no botão salvar alteração
    
Cenário de GET: Editar usuário
    [Tags]    get
    Passo 1 - acessar a página de login Qa.Coders Academy
    Passo 2 – digitar e-mail
    Passo 3 – digitar senha
    Passo 4 – clicar no botão entrar
    Passo 5 – clicar em cadastro
    Passo 6 – clicar em usuários
    Passo 7 - clicar em pesquisar


# Cenário de Delete: Editar usuário
#     [Tags]    delete
#     Passo 1 - acessar a página de login Qa.Coders Academy
#     Passo 2 – digitar e-mail
#     Passo 3 – digitar senha
#     Passo 4 – clicar no botão entrar
#     Passo 5 – clicar em cadastro
#     Passo 6 – clicar em usuários
#     Passo 7.2 - editar usuario
#     # Passo 8 – digitar nome completo
#     # Passo 9 – digitar email
#     # Passo 10 – clicar no botão salvar alteração