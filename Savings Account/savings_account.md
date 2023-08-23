# Introdução
## Módulos
Até agora, todos os exercícios que você viu usaram aulas. Às vezes, não precisamos da sobrecarga de criar um objeto com estado; portanto, usamos module.

Um módulo é muito semelhante a uma classe ( de fato, Module é Class' pai na hierarquia de objetos ) - a principal diferença é que, em vez de usar métodos de instância, usamos métodos de classe. Os métodos de classe começam com self. e são chamados diretamente em um módulo.

Por exemplo:,

``` ruby
module Speaker
  def self.echo(something)
    "#{something} ... #{something}"
  end
end

Speaker.echo("Hello")   #=> "Hello ... Hello"
```

## Loops
Existem várias maneiras de escrever loops no Ruby, mas como tendemos a usar a enumeração em vez de aparecer em geral, o loop mais comumente visto talvez seja o while loop:

``` ruby
counter = 0

while counter < 5
  counter += 1
end
```

Você também pode usar o irmão until

``` ruby
counter = 0

until counter == 5
  counter += 1
end
```

# Instruções
Neste exercício, você estará trabalhando com contas de poupança. A cada ano, o saldo de uma conta poupança é atualizado com base na taxa de juros. A taxa de juros que o banco concede depende da quantia em dinheiro nas contas ( seu saldo ):

0,5% para um saldo não negativo inferior a 1000 dólares.
1,621% para um saldo positivo maior ou igual a 1000 dólares e menos que 5000 dólares.
2,475% para um saldo positivo maior ou igual a 5000 dólares.
3,213% para um saldo negativo ( resultados em juros negativos ).
Você tem três tarefas, cada uma das quais tratará do saldo e de sua taxa de juros.

## 1. Calcular a taxa de juros
Implementar o SavingsAccount.interest_rate método para calcular a taxa de juros com base no saldo especificado:

``` ruby
SavingsAccount.interest_rate(200.75)
#=> 0.5
```

Observe que o valor retornado é uma instância de Float.

## 2. Calcular a atualização do saldo anual
Implementar o SavingsAccount.annual_balance_update método para calcular a atualização do saldo anual, levando em consideração a taxa de juros:

``` ruby
SavingsAccount.annual_balance_update(200.75)
#=> 201.75375
```

Observe que o valor retornado é uma instância de Float.

## 3. Calcule os anos antes de atingir o saldo desejado
Implementar o SavingsAccount.years_before_desired_balance método para calcular o número mínimo de anos necessários para atingir o saldo desejado:

``` ruby
SavingsAccount.years_before_desired_balance(200.75, 214.88)
#=> 14
```

Observe que o valor retornado é uma instância de Integer.

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```