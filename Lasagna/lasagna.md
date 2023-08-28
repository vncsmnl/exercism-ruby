# Introdução
Este exercício ensinará os blocos fundamentais de Ruby. Ele cobre muito terreno, mas não se preocupe se parecer esmagador, entraremos em tudo com muito mais profundidade à medida que continuarmos na pista.

Uma das principais coisas a entender sobre Ruby é que é um linguagem orientada a objetos, e aquilo tudo em Ruby é um objeto. Números, cordas, matrizes - são todos objetos.

## Variáveis e constantes
Tendemos a fazer uso de objetos atribuindo-lhes nomes, usando variáveis ou constantes.

As variáveis são sempre escritas em Snake_case. Uma variável pode fazer referência a diferentes objetos ao longo de sua vida útil. Por exemplo, my_first_variable pode ser definido e redefinido muitas vezes usando o = operador:

``` ruby
my_first_variable = 1
my_first_variable = "Some string"
my_first_variable = SomeComplexObject.new
```
Constantes, no entanto, devem ser designadas uma vez. Eles devem começar com letras maiúsculas e normalmente são escritos em maiúsculas com palavras separadas por sublinhados. Por exemplo:

``` ruby
MY_FIRST_CONSTANT = 10

# Redefining not allowed
# MY_FIRST_CONSTANT = "Some String"
```

## Classes
Ruby é organizado em aulas. As classes são definidas usando o class palavra-chave seguida pelo nome da classe. Os objetos geralmente são criados por classes instanciantes usando o .new método. Por exemplo: 

``` ruby
# Define the class
class Calculator
  #...
end

# Create an instance of it and assign it to a variable
my_first_calc = Calculator.new
```

## Métodos
Unidades de funcionalidade são encapsuladas em métodos - semelhantes a funções em outros idiomas.

Um método pode ser definido com argumentos posicionais, argumentos de palavras-chave ( que são definidos e chamados usando o : sintaxe ) ou não possui argumentos.

Os métodos retornam implicitamente o resultado da última instrução avaliada ou podem retornar explicitamente um objeto através do return palavra-chave.

``` ruby
class Calculator

  # Positional arguments
  def add(num1, num2)
    return num1 + num2 # Explicit return
  end

  # Keyword arguments
  def multiply(num1:, num2:)
    num1 * num2 # Implicit return
  end
end
```

Os métodos são invocados usando . sintaxe:

``` ruby
calc = Calculator.new
calc.add(1, 3)
calc.multiply(num1: 2, num2: 5)
```

# Instruções
Neste exercício, você escreverá um código para ajudá-lo a cozinhar uma lasanha brilhante do seu livro de culinária favorito.

Você tem quatro tarefas, todas relacionadas ao tempo gasto na culinária da lasanha.

## 1. Defina o tempo esperado do forno em minutos
Definir o Lasagna::EXPECTED_MINUTES_IN_OVEN constante que retorna quantos minutos a lasanha deve estar no forno. De acordo com o livro de receitas, o tempo esperado do forno em minutos é de 40:

``` ruby
Lasagna::EXPECTED_MINUTES_IN_OVEN
# => 40
```

## 2. Calcule o tempo restante do forno em minutos
Definir o Lasagna#remaining_minutes_in_oven método que leva os minutos reais em que a lasanha esteve no forno como um parâmetro e retorna quantos minutos a lasanha ainda precisa permanecer no forno, com base no tempo esperado do forno em minutos da tarefa anterior.

``` ruby
lasagna = Lasagna.new
lasagna.remaining_minutes_in_oven(30)
# => 10
```

## 3. Calcule o tempo de preparação em minutos
Definir o Lasagna#preparation_time_in_minutes método que leva o número de camadas que você adicionou à lasanha como um parâmetro e retorna quantos minutos você gastou preparando a lasanha, assumindo que cada camada leva 2 minutos para preparar.

``` ruby
lasagna = Lasagna.new
lasagna.preparation_time_in_minutes(2)
# => 4
```
## 4. Calcule o tempo total de trabalho em minutos
Definir o Lasagna#total_time_in_minutes método que leva dois parâmetros nomeados: o number_of_layers parâmetro é o número de camadas que você adicionou à lasanha e o actual_minutes_in_oven parâmetro é o número de minutos o lasanha esteve no forno. A função deve retornar quantos minutos no total você trabalhou para cozinhar a lasanha, que é a soma do tempo de preparação em minutos e o tempo em minutos que a lasanha passou no forno no momento.

``` ruby
lasagna = Lasagna.new
lasagna.total_time_in_minutes(number_of_layers: 3, actual_minutes_in_oven: 20)
# => 26
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>