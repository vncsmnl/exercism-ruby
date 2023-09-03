# Instruções
Se você deseja construir algo usando um Raspberry Pi, provavelmente usará resistores. Para este exercício, você precisa saber duas coisas sobre eles:

- Cada resistor tem um valor de resistência.
- Os resistores são pequenos - tão pequenos que, se você imprimisse o valor da resistência neles, seria difícil ler.

Para contornar esse problema, os fabricantes imprimem bandas codificadas por cores nos resistores para indicar seus valores de resistência. Cada banda tem uma posição e um valor numérico.

As duas primeiras bandas de um resistor têm um esquema de codificação simples: cada cor é mapeada para um único número. Por exemplo, se eles imprimissem uma banda marrom ( valor 1 ) seguido por uma faixa verde ( valor 5 ), isso se traduziria para o número 15.

Neste exercício, você criará um programa útil para não precisar se lembrar dos valores das bandas. O programa terá nomes de cores como entrada e produzirá um número de dois dígitos, mesmo que a entrada seja superior a duas cores!

As cores da banda são codificadas da seguinte forma:

- Preto: 0
- Castanho: 1
- Vermelho: 2
- Laranja: 3
- Amarelo: 4
- Verde: 5
- Azul: 6
- Violeta: 7
- Cinza: 8
- Branco: 9

No exemplo acima: marrom-verde deve retornar 15 marrom-verde-violeta também deve retornar 15, ignorando a terceira cor.

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>