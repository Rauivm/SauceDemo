# SauceDemo com RobotFramework

Automação de Testes com Robotframework: Utilizar Robotframework para criar e executar testes automatizado

    Controle de Versão com Git: Utilizar Git para versionar o código e enviar as soluções.

Metodologia Ágil: Demonstrar entendimento de práticas ágeis aplicando técnicas de BDD.

Criação de Testes Automatizados
Escreva testes automatizados para os seguintes casos:
1. Login: Teste o login com um usuário válido e inválido.
2. Visualização de Produtos: Teste a visualização da lista de produtos após o login.
3. Adicionar ao Carrinho: Teste a adição de um ou mais produtos ao carrinho.
4. Remover do Carrinho: Teste a remoção de produtos do carrinho.
5. Finalizar Compra: Teste o fluxo de finalização de compra.
A criação de novos cenários será um diferencial. Utilize boas práticas de automação de testes, como Page
Object Model (POM) e reutilização de código.

## Instalação

Para instalar as dependências do projeto, execute:

```bash
pip install -r requirements.txt
robot -d ./logs  tests/bdd_cases.robot
