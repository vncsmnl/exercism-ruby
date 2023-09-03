# Introdução
Em alguns sotaques ingleses, quando você diz "dois a favor" rapidamente, soa como "dois fer". Dois por um é uma maneira de dizer que se você compra um, também recebe um de graça. Portanto, a frase "dois-fer" geralmente implica uma oferta dois por um.

Imagine uma padaria que tenha uma oferta de férias onde você pode comprar dois biscoitos pelo preço de um ( "dois-seres!" ). Você aceita a oferta e ( generosamente ) decide dar o cookie extra a um amigo.

# Instruções
Sua tarefa é determinar o que você dirá ao distribuir o cookie extra.

Se seu amigo gosta de biscoitos e se chama Do-yun, você dirá:

``` ruby
One for Do-yun, one for me.
```

Se seu amigo não gosta de biscoitos, você entrega o cookie para a próxima pessoa na fila da padaria. Como você não sabe o nome deles, dirá você em vez disso.

``` ruby
One for you, one for me.
```

Aqui estão alguns exemplos:

| Nome | Diálogo |
|------|---------|
| Alice |  Um para Alice, um para mim. |
| Bohdan |    Um para Bohdan, um para mim.|
|  |    Um para você, um para mim.|
| Zaphod | Um para Zaphod, um para mim.|

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>