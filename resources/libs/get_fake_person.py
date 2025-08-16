import re
import unicodedata
from faker import Faker
import random

faker = Faker('pt_BR');


def get_fake_person():
    person = {
         "name": limpar_ponto_nome(faker.name()),
         "email": faker.email(),
         "cpf": limpar_cpf(faker.cpf()),
    }
    return person

# Remove pontos de uma string de nome.
def limpar_ponto_nome(nome):
    # Remove apenas o ponto
    nome_limpo = nome.replace('.', '')
    return nome_limpo

# Remove pontos e traços de uma string de CPF.
def limpar_cpf(cpf):
    # Remove pontos e traços
    cpf_limpo = cpf.replace('.', '').replace('-', '')
    return cpf_limpo

def limpar_cnpj(cnpj):
    cnpj_limpo = cnpj.replace('.', '').replace('-', '').replace('/', '')
    return cnpj_limpo

def limpar_zipCode(zipCode):
    zipCode_limpo = zipCode.replace('.', '').replace('-', '').replace('/', '')
    return zipCode_limpo

def limpar_country(country):
    # Remove acentos
    country_sem_acentos = unicodedata.normalize('NFKD', country).encode('ASCII', 'ignore').decode('utf-8')
    country_limpo = ' '.join(country_sem_acentos.split())
    # Verifica se é uma única palavra (sem espaços)
    if ' ' in country_limpo:
        return None  # ou '' ou lance uma exceção, se preferir
    # Remove qualquer caractere que não seja letra
    country_formatado = re.sub(r'[^a-zA-Z]', '', country_limpo).lower()
    return country_formatado

def gerar_telefone_sem_formatacao():
    return faker.msisdn()

def get_fake_company():
    company = {
        "nome_empresa": faker.company(),
        "cnpj": limpar_cnpj(faker.cnpj()),
        "telefone": gerar_telefone_sem_formatacao(),
        "email": faker.company_email(),
        "zipCode": limpar_zipCode(faker.postcode()),
        "city": faker.city(),
        "state": faker.state_abbr(),
        "district": faker.street_name(),
        "street": faker.street_name(),
        "number": faker.building_number(),
        "country": faker.country(),
        "descricao": faker.job(),
        "responsavel": limpar_ponto_nome(faker.name()), 
    }
    return company


def get_fake_board():
    nome_diretoria = [
        "Administrativa", "Técnica", "Comercial", "Financeira", "Projetos",
        "RH", "Operações", "Logística", "Marketing", "Jurídica",
        "Estratégica", "Inovação", "Internacional", "Tecnologia",
        "Suprimentos", "Qualidade", "Comunicação", "Expansão",
        "Investimentos", "Sustentabilidade"
    ]
    letras = ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ', k=3))
    return f"{random.choice(nome_diretoria)} {letras}"
