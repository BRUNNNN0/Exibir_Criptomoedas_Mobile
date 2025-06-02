# App Criptomoedas

Aplicativo Flutter para consulta de criptomoedas em tempo real, utilizando arquitetura MVVM com boas práticas de programação. Os dados são consumidos diretamente da API da Coin Market Cap.

## Tecnologias Utilizadas

- Dart
- Flutter
- Arquitetura MVVM
- Padrões de boas práticas
- Integração com a API Coin Market Cap

## Funcionalidades

### 1. Consulta de Criptomoedas

Na tela inicial, o usuário pode visualizar uma lista com várias criptomoedas populares.  
As informações exibidas nos cards são:

- Nome da Criptomoeda
- Sigla
- Valor em USD
- Valor em BRL

### 2. Exibir Informações Adicionais

Ao clicar em um card de uma moeda, é aberta uma subtela com detalhes adicionais:

- Nome da Criptomoeda
- Sigla
- Data em que foi adicionada
- Preço atual em USD
- Preço atual em BRL

### 3. Busca por Criptomoedas

O usuário pode buscar qualquer criptomoeda:

- Digite siglas separadas por vírgula (ex: BTC, ETH, ADA) no campo de busca.
- Pressione o botão "BUSCA".
- Caso o campo esteja vazio, o app irá ordenar as moedas em ordem alfabética pelas siglas.

### 4. Atualização dos Dados

- Os dados são atualizados em tempo real, diretamente da API.
- O usuário pode usar o pull-to-refresh para atualizar as moedas manualmente.


### Imagens e explicação da Aplicação 

## Tela Inicial com Criptomoedas

 Ao executar o aplicativo ele automaticamente já faz o GET na API e retorna as moedas, caso falhe na requisição vale a pena tentar executar o pull-to-refresh. Na tela inicial, você vai poder visualizar as principais criptomoedas e seus valores tanto em US quanto em BRL.

![Screenshot_2025-06-02-14-57-22-421_com example app_criptomoeda](https://github.com/user-attachments/assets/c24cb639-afe7-4d9e-8333-50bc745a989a)

## Detalhes da Moeda Selecionada

Clicando em um dos card, a aplicação irá mostrar uma subtela com as informações adicionais da moeda.

![Screenshot_2025-06-02-14-58-03-524_com example app_criptomoeda](https://github.com/user-attachments/assets/ffe3e0af-d5dd-4cc6-a029-378e55fcbc34)

## Busca de Criptomoedas

Caso queira procurar moedas específicas, digite a sigla da moeda no campo de busca, não precisa ser necessariamente em letras maiúsculas, mas as siglas precisam estar separadas por vírgula e pressione o botão "BUSCA".

![Screenshot_2025-06-02-14-58-42-562_com example app_criptomoeda](https://github.com/user-attachments/assets/d2038fc0-3a4a-4865-a5e0-73e406458405)


### Como Executar

## Configuração da Aplicação

A única configuração para a execução é colocar o token que o site da Coin Market Cap fornece, como eles não dão necessariamente um login e te passam o token, então fiz algo manual. Caso o meu token não esteja funcionando, basta seguir as imagens abaixo: 

![Screenshot 2025-06-02 153537](https://github.com/user-attachments/assets/aab423a0-98b9-42fc-b67b-b5b3cb8855e8)
![Screenshot 2025-06-02 153655](https://github.com/user-attachments/assets/b5ba12b9-512e-413c-b706-696486d00afd)


## Inserindo o Token

com o token copiado é só acessar a pasta do projeto:

app_criptomoeda -> lib -> configs -> environment_helper.dart 

colocar seu token na linha 21 -> final String apiKey = 'Sua API key';

![image](https://github.com/user-attachments/assets/ff32cb6e-abfa-418f-a79d-feedd422bf68)


```bash
# Clone o repositório
git clone https://github.com/BRUNNNN0/app_criptomoeda.git

# Navegue até a pasta
cd app_criptomoeda

# Instale as dependências
flutter pub get

# Execute no emulador ou dispositivo
flutter run
```
