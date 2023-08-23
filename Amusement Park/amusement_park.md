# Introdução
Variáveis de instância
Os objetos podem manter seu próprio estado definindo variáveis de instância. Essas variáveis vivem dentro de um objeto e são normalmente usadas para armazenar algum estado interno.

As variáveis de instância sempre começam com um @. Você pode criar uma nova variável de instância definindo uma variável começando com uma @. Por exemplo:

``` ruby
class Repeater
  def hear(something)
    # Save what's been heard into a new instance variable called @heard
    @heard = something
  end

  def repeat
    # Return the value of the instance variable
    @heard
  end
end

repeater = Repeater.new
repeater.hear("Hello, friend!")
print repeater.repeat # Prints "Hello, friend!"
```

Os objetos geralmente definem seu estado inicial em um initialize método, que é chamado automaticamente ao ligar new em uma aula.

``` ruby
class Airplane
  def initialize
    @wings = 2
  end

  def wings
    @wings
  end
end

plane = Airplane.new
plane.wings # returns 2
```

O initialize O método também pode receber argumentos, para que cada instância possa começar com um estado personalizado:

``` ruby
class Suitcase
  def initialize(locked)
    @locked = locked
  end
end
```

É uma boa prática considerar instância variáveis para serem privadas de leituras e gravações externas. Em vez disso, definimos métodos para obter e definir seus valores. Por exemplo:

``` ruby
class Suitcase
  def initialize
    @locked = false
  end

  def locked? # Query methods should be named with a trailing `?`
    @locked
  end

  def lock! # Methods which mutate state should have trailing `!`
    @locked = true
  end
end

suitcase = Suitcase.new
suitcase.locked? # false
suitcase.lock!
suitcase.locked? # true
```

Nil
Nil é uma palavra em inglês que significa "nada" ou "zero". Em Ruby, nil é usado para expressar o ausência de um objeto. Em outras linguagens de programação, null ou none valores podem desempenhar um papel semelhante.

``` ruby
# I do not have a favorite color
favorite_color = nil
```

Ruby fornece a qualquer variável de instância o valor padrão de nil quando for encontrado pela primeira vez, até que seja dado um valor.

``` ruby
print @favourite_color # prints nil
@favourite_color = "blue"
print @favourite_color # prints "blue"
```

# Instruções
Trabalhando com um parque de diversões, você recebeu uma especificação para projetar um sistema para administrar a participação e passeios. Você foi encarregado de modelar o participante ( pessoa que visitou o parque ).

## 1. Faça novos participantes
Implementar o Attendee#initialize método do Attendee classe, deve ter uma altura ( em centímetros ) e armazenar como uma variável de instância

``` ruby
Attendee.new(106)
# => #<Attendee:0x000055c33e6c7e18 @height=106>
```
## 2. Qual a altura do participante
Implementar o Attendee#height getter do Attendee classe, deve retornar a altura das instâncias

``` ruby
Attendee.new(106).height
# => 106
```

## 3. Qual é a identificação do passe de passeio
Nem todos os participantes compraram um passe de viagem, mas precisamos saber se eles têm um passe ou não. Implementar o Attendee#pass_id getter para o Attendee classe, deve retornar o pass_id da instância ou nil se o participante não tem um.

``` ruby
Attendee.new(106).pass_id
# => nil
```

## 4. Permita que as pessoas comprem um passe
Implementar Attendee#issue_pass! para alterar o estado da instância e defina a variável da instância do ID de aprovação como argumento. Ele deve retornar a identificação do passe.

``` ruby
attendee = Attendee.new(106)
attendee.issue_pass!(42)
attendee.pass_id
# => 42
```

## 5. Revogar o passe
Alguns convidados quebram as regras com um comportamento inseguro, então o parque quer poder revogar passes. Implementar Attendee#revoke_pass! para alterar o estado da instância e defina o ID do passe para nil

``` ruby
attendee = Attendee.new(106)
attendee.issue_pass!(42)
attendee.revoke_pass!
attendee.pass_id
# => nil
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```
