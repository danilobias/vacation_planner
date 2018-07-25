# Vacation Planner

Este projeto visa solucionar o problema proposto abaixo, conforme descrição.

Para este projeto foi escolhido como arquitetura o MVVM, que vem sendo muito utilizado hoje em dia em diversos projetos.

# Descrição: The Vacation Planner

Você recebeu quinze dias de férias para tirar a qualquer momento do próximo ano e está planejando visitar o Rio de Janeiro.

Para isso, você gostaria de encontrar a quinzena com a melhor temperatura possível. Encontrar esse padrão parece ser muito difícil a olho nu, então você resolve criar uma aplicação que consuma dados climáticos e sugira as melhores épocas do ano.
 
* Para encontrar a lista de cidades disponíveis, você utiliza (GET) localhost:8882/cities/

* Para descobrir os climas diários para um determinado ID em um determinado ano, você utiliza (GET) localhost:8882/cities/`{id}`/year/`{ano}`

* Para encontrar a lista de condições climáticas existentes, você utiliza (GET) localhost:8882/weather/

 
A aplicação deve ser capaz de receber informações como dias de férias, cidade-destino e intervalo de temperaturas aceitáveis para exibir todos os intervalos maiores ou iguais ao número de dias de férias inseridos que satisfaçam as características especificadas.

# Instalação
Para executar o projeto, é necessário ter o Cocoapods instalado:<br />
- sudo gem install cocoapods <br />
- pod install <br />
- Abrir o projeto através do arquivo VacationPlanner.xcworkspace<br /><br />

## Requisitos:

- iOS 11.0+
- Xcode 9.4+
- Swift 4.0
- Stubby4j >= v.5.0.1

## Como utilizar o Stubby4j:

Descompacte o arquivo mobile_assignment.zip (o arquivo se encontra na branch master desse repositório)

Baixe o jar do stubby4j e coloque-o na pasta mobile_tech_assignment.

Execute o stubby4j através do comando: 

`java -jar stubby4j-x.x.xx.jar -d tech_assignment_mobile_stubs.yml`

## Bibliotecas utilizadas
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
- [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager)
- [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)

### Contato
- [LinkedIn](https://www.linkedin.com/in/danilobias/)
- [E-mail](danilobias@hotmail.com)