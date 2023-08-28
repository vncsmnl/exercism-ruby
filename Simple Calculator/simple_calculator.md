# Introdução
Exceções em Ruby, como em muitos idiomas, fornecem uma maneira de lidar com eventos inesperados. O manuseio adequado das exceções é importante ao tentar impedir que seu programa falhe.

Quando uma exceção é levantada, aumentando-a explicitamente ou pelo intérprete Ruby, o programa desvia a operação normal e, eventualmente, sai com uma mensagem de erro:

```
raise ArgumentError.new("Something went wrong!")
=> Traceback (most recent call last):
.
.
ArgumentError (Something went wrong!)
1/0
=> Traceback (most recent call last):
.
.
ZeroDivisionError (divided by 0)
```

Caso desejemos interromper esse processo de desligamento, precisamos reagir à exceção. Isso é chamado de "resgatando" uma exceção:

```
begin
  # ...any code that raises an exception
rescue
  puts 'Got an exception'
end
```

Este programa não trava e produz "Tem uma exceção". Em vez de sair, Ruby executa o código no bloco de resgate, que imprime uma mensagem.

Como tudo no Ruby, as exceções também são objetos e geralmente contêm dados sobre a exceção. É assim que podemos obter o objeto de exceção:

```
begin
  # ...any code that raises an exception
rescue => e
  puts "Exception class: #{ e.class.name }"
  puts "Exception Message:#{e.message}"
end
```

Em Ruby, também é possível levantar suas próprias exceções. Por exemplo:

```
begin
  raise ArgumentError.new("Invalid argument")
rescue ArgumentError => e
  puts e.message
end
```
A exceção anterior é uma das exceções incorporadas do Ruby, mas também é possível definir exceções personalizadas e aumentá-las:

```
class CustomError < StandardError
end

raise CustomError.new("Something went wrong")
```

# Instruções
Neste exercício, você estará criando um tratamento de erros para uma calculadora simples.

O objetivo é ter uma calculadora de trabalho que retorne uma sequência com o seguinte padrão: 16 + 51 = 67, quando fornecido com argumentos 16, 51 e +.

```
SimpleCalculator.calculate(16, 51, "+")
# => "16 + 51 = 67"
SimpleCalculator.calculate(32, 6, "*")
# => "32 * 6 = 192"
SimpleCalculator.calculate(512, 4, "/")
# => "512 / 4 = 128"
```

## 1. Lidar com o código que pode gerar erros dentro do método calculate
O principal método para implementação nesta tarefa será o método de classe SimpleCalculator.calculate() método. São necessários três argumentos. Os dois primeiros argumentos são números sobre os quais uma operação será conduzida. O terceiro argumento é do tipo string e, para este exercício, é necessário implementar as seguintes operações:

adição usando o + string
multiplicação usando o * string
divisão usando o / string

## 2. Lidar com operações ilegais
Atualizar o SimpleCalculator.calculate() método para aumentar um UnsupportedOperation exceção para símbolos de operação desconhecidos.

```
SimpleCalculator.calculate(1, 2, '-')
# => Raises an UnsupportedOperation
```

## 3. Lidar com argumentos inválidos
Atualizar o SimpleCalculator.calculate() método para aumentar um ArgumentError exceção para tipos de argumentos inválidos.

```
SimpleCalculator.calculate(1, '2', '*')
# => Raises an ArgumentError
```

## 4. Alça as exceções DivideByZero
Atualizar o SimpleCalculator.calculate() lidar ZeroDivisionError exceções. O código de manuseio deve retornar a sequência com o conteúdo Division by zero is not allowed.. Qualquer outra exceção não deve ser tratada pelo SimpleCalculator.calculate() método.

```
SimpleCalculator.calculate(512, 0, "/")
# => returns "Division by zero is not allowed."
```