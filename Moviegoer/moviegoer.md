# Introdução
## O operador ternário
Um condicional ternário é uma maneira mais curta de escrever simples if/else declarações. Se um if/else a declaração contém apenas dois ramos, um para quando a condição é verdadeira e outro para quando é falsa, pode ser reescrito como condicional ternária.

Os ternários usam uma combinação do ? e : símbolos para dividir um condicional:

```
condition ? true_branch : false_branch
```

O código no lado esquerdo do ? é a condição e o código à direita contém os dois ramos possíveis, separados pelo :. Se a condição for verdade, o código no esquerda lado do : é executado. Se a condição for falso, então o código no direita do : é executado.

Por exemplo:

```
if traffic_light == 'green'
  cross_the_road
else
  wait
end
```

pode ser reescrito como:

```
traffic_light == 'green' ? cross_the_road : wait    
```

# Instruções
Neste exercício, você elaborará regras para o site de um cinema.

## 1. Verifique se um espectador tem direito ao desconto dos idosos
O teatro oferece um desconto para "pensões de velhice". Quem tem 60 anos ou mais paga 10,00 por um ingresso. Qualquer pessoa mais jovem paga os 15,00 completos.

Escreva o Moviegoer#ticket_price método usando uma declaração ternária.

```
Moviegoer.new(21).ticket_price
#=> 15

Moviegoer.new(65).ticket_price
#=> 10
```

## 2. Verifique se um espectador pode assistir filmes de terror
O cinema possui um sistema simplificado de verificação de idade. Se você tem 18 anos ou mais, pode assistir a filmes de terror. Se você é mais jovem, não pode.

Implementar o Moviegoer.watch_scary_movie? método. Deve retornar se alguém tem permissão para assistir ao filme ou não.

```
Moviegoer.new(21).watch_scary_movie?
#=> true

Moviegoer.new(17).watch_scary_movie?
#=> false
```

## 3. Verifique se um espectador tem direito a pipoca grátis
O cinema tem um programa de Movie Club. Os membros recebem pipoca grátis quando assistem a qualquer filme.

Implementar o Moviegoer.claim_free_popcorn! método. Se um espectador é membro de um clube de cinema, ele deve ser recompensado com sua pipoca grátis. Caso contrário, o método deve aumentar o NotMovieClubMemberError exceção definida na parte superior do código.

```
Moviegoer.new(21, member: true).claim_free_popcorn!
#=> 🍿

Moviegoer.new(17, member: false).claim_free_popcorn!
#=> Exception was raised! (NotMovieClubMemberError)
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>