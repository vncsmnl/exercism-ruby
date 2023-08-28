# Introdução
Verdadeiro e Falso
Estados lógicos verdadeiros e falsos são representados com true e false em Ruby.

``` ruby
happy = true
sad = false
```

## Igualdade e comparação
Ruby permite comparar objetos entre si usando os símbolos de igualdade normais:

Usar == para ver se dois objetos são iguais
Usar > para ver se o objeto à esquerda é maior que o objeto à direita
Usar < para ver se o objeto à esquerda é menos que o objeto à direita.
Usar >= ou <= testar "maior ou igual a" e "menor ou igual a", respectivamente.
Você também pode usar a lógica booleana com os operadores normais:

Usar && ou and para verificar se x and y são verdadeiras
Usar || ou or para verificar se x or y é verdade.
Usar ! ou not inverter a igualdade - p. x != y ( x não é igual a y )
Aqui estão alguns exemplos:

``` ruby
# Is "true equal to false"? 
true == false # false

# Is "true not equal to false"
true != false # true

# Is 5 greater than 4?
5 > 4 # true

# Is 3 less than or equal to 2?
3 <= 2 # false
```

# Instruções
Continuando seu trabalho com o parque de diversões, você tem a tarefa de escrever alguns métodos de utilidade para facilitar a verificação se um participante pode usar uma carona.

## 1. Verifique se um participante tem um passe de carona
Implementar o Attendee#has_pass? método para retornar um booleano (true/falseValor ) com base na presença de uma carona passe.

``` ruby
Attendee.new(100).has_pass?
# => false
```

## 2. Verifique se um participante se encaixa em uma carona
Implementar o Attendee#fits_ride? método para ver se um participante se encaixa em um passeio com base em sua altura. O passeio é necessário altura mínima é fornecida como argumento. Um participante deve ter altura maior ou igual ao mínimo exigido para andar altura.

``` ruby
Attendee.new(140).fits_ride?(100)
# => true
```

## 3. Verifique se um participante pode andar
Implementar o Attendee#allowed_to_ride? método para ver se um participante pode dar uma volta. O passeio é necessário altura mínima é fornecida como argumento. Um participante deve ter um passe de passeio e poder montar o passeio.

``` ruby
attendee = Attendee.new(100)
attendee.issue_pass!(42)
attendee.allowed_to_ride?(120)
# => false
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>