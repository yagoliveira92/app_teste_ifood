<p align="center">
   App Teste para vaga no iFood.
   <br>
    <p align="center">
      <img src="https://img.shields.io/badge/flutter-3.22.1-blue" />
      <img src="https://img.shields.io/badge/dart-%3E=3.4.1%20%3C4.0.0-blue" />
      <img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fatrox%2Fsync-dotenv%2Fbadge" />
    </p>

## Índice

- [Índice](#índice)
- [Início](#início)
- [Build](#build)
- [Run](#Run)
- [Packages e Dependências](#packages-e-dependências)
- [CI/CD](#cicd)

## Início
Este projeto segue o Clean Architecture com TDD exemplificada pelo [Resocoder](https://resocoder.com/flutter-clean-architecture-tdd/), assim como o [Cubit](https://bloclibrary.dev/) para gestão de estado.

Demais dúvidas pode abrir uma issue ou consultar a [documentação oficial](https://flutter.io/docs/get-started/install).

## Build
Para gerar o build do projeto, você precisa de uma chave de API da [OpenWeather](https://openweathermap.org/). 
Com ela em mãos, você pode gerar o build com o comando:
```bash
flutter build apk --dart-define=WEATHER_API_KEY=sua_chave_aqui
```

## Run
Para executar o projeto, você também irá precisar da chave de API da [OpenWeather](https://openweathermap.org/).
Com ela em mãos, você pode executar o projeto com o comando:

```bash
flutter run --dart-define=WEATHER_API_KEY=sua_chave_aqui
```
Não há integração com um serviço de autenticação. Para acessar o aplicativo, basta colocar um email e senha qualquer.
e clicar em "Entrar".

## Packages e Dependências

Todos os packages e dependências estão no `pubspec.yaml`, mas listamos abaixo as principais com os links para poder consultar:

* [cubit](https://pub.dev/packages/bloc) Para gestão de estado,
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) Integrar o bloc aos Widgets do Flutter,
* [sembast](https://pub.dev/packages/sembast) Banco de dados NoSQL usado no projeto,
* [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) Armazenamento criptografado para guardar o token JWT,
* [go_router](https://pub.dev/packages/go_router) Pacote que gerencia as rotas, tornando sua gestão mais fácil,
* [get_it](https://pub.dev/packages/get_it) Usado para injeção de dependência,

## CI/CD

Para a Distribuição dos builds usamos o [Firebase App Distribution](https://firebase.google.com/docs/app-distribution). Ele que diferencia e gerencia quem recebe e quem pode testar. Entre em contato com o chefe de Engenharia para ter acesso ao `Firebase`.

Utilizamos o **Github Actions** com **Fastlane** para o CI do Projeto, onde temos as seguintes configurações:

* Temos 3 tipos de Tags, a **Alpha**, **Beta** e a de **Release**. Eles seguem o padrão [GitFlow](https://danielkummer.github.io/git-flow-cheatsheet/).

* **Alpha**
   - Usada para gerar builds dentro da sua branch de trabalho. Ela pode ser usada em qualquer branch e a build gerada se comunicará com o ambiente configurado no arquivo `main_development.dart` e entrega no `Firebase App Distribution`
   - A forma de ser usada é: `v.1.0.0-alpha.01`, onde o número após o nome `alpha` é o que cresce a cada build novo.
* **Beta**
   - Usada para gerar builds apartir da Develop. Diferente da build `alpha` essa aponta para o ambiente de Produção, mas ainda entrega no `Firebase App Distribution`
   - A forma de ser usada é: `v.1.0.0-beta.01`, onde o número após o nome `beta` é o que cresce a cada build novo.
* **Release**
   - Usada exclusivamente para gerar builds e **enviar para as lojas**, portanto **CUIDADO**. A única branch que usa essa funcionalidade é a `main`.
   - A forma de ser usada é: `v.1.0.0`.

* Na parte de Distribuição usamos o `Firebase App Distribution`


Recomendamos que estude um pouco de [Fastlane](https://flutter.dev/docs/deployment/cd) para poder dar as manutenções.
