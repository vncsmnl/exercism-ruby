# Introdução
## Matrizes
Em Ruby, matrizes são ordenadas, coleções indexadas por números inteiros de qualquer objeto. A indexação de matriz começa em 0. Presume-se que um índice negativo seja relativo ao final da matriz —, por exemplo, um índice de -1 indica o último elemento da matriz, -2 é o próximo ao último elemento da matriz e assim por diante.

## Criando matrizes
As matrizes são normalmente criadas usando o [] notação. Eles podem criar qualquer tipo diferente de objeto.

``` ruby
array = [1, "two", 3.0]
```

## Referência do elemento
Os elementos em uma matriz podem ser recuperados por seus índices usando o #[] método. Isso retorna o elemento no índice ou retorna uma sub-matriz começando no índice inicial e continuando por um comprimento especificado. Índices negativos contam para trás a partir do final da matriz.

``` ruby
a = [ "a", "b", "c", "d", "e" ]

a[2]       #=> "c"
a[6]       #=> nil
a[1, 3]    #=> [ "b", "c", "d" ]

a[-1]      #=> "e"
a[-2]      #=> "d"
a[-3, 2]   #=> ["c", "d"]
```

## Métodos de Auxiliar
Existem muitos métodos auxiliares úteis nas matrizes. Aqui estão alguns dos mais comuns:,

``` ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.size      #=> 8
fibonacci.sum       #=> 33
fibonacci.reverse   #=> [13, 8, 5, 3, 2, 1, 1, 0]
```

## Enumeração
Em vez de usar loops para iterar através de coleções, em Ruby usamos enumeração.

Enumeração é o ato de passar por uma coleção ( neste caso, uma matriz ) e executar alguma ação em cada objeto. A enumeração é um conceito-chave no Ruby e é usada para coisas como classificação, agrupamento, mapeamento, redução e muito mais.

Uma enumeração para imprimir cada palavra em uma matriz seria assim:

``` ruby
words = ["the", "cat", "sat"]
words.each do |word|
  puts word
end

# Output:
# the
# cat
# sat
```

Neste exemplo, chamamos de .each método em nossa matriz e passado em um bloco que usa um parâmetro (word) e imprime.

Vamos olhar blocos muito mais profundamente mais tarde na pista, mas por enquanto pense nelas como funções anônimas que podem levar zero ou mais argumentos. Eles podem ser definidos usando o do...end sintaxe ( acima de ) ou {} sintaxe ( abaixo de ).

Aqui estão alguns outros exemplos de métodos de matriz que usam blocos:

``` ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number == 6 }   #=> false
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
```

# Instruções
Você é um ávido observador de pássaros que acompanha quantos pássaros visitaram seu jardim nos últimos sete dias.

Você tem cinco tarefas, todas lidando com o número de pássaros que visitaram seu jardim.

## 1. Verifique quais foram as contagens na semana passada
Para fins de comparação, você sempre mantém uma cópia das contagens da semana passada nas proximidades, que eram: 0, 2, 5, 3, 7, 8 e 4. Implementar o BirdCount.last_week método que retorna as contagens da semana passada:

``` ruby
BirdCount.last_week
# => [0, 2, 5, 3, 7, 8, 4]
```

## 2. Verifique quantos pássaros visitaram ontem
Implementar o BirdCount#yesterday método para retornar quantos pássaros visitaram seu jardim ontem. A contagem de pássaros é ordenada por dia, com o primeiro elemento sendo a contagem do dia mais antigo e o último elemento sendo a contagem de hoje.

``` ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.yesterday
# => 4
```

## 3. Calcule o número total de aves visitantes
Implementar o BirdCount#total método para retornar o número total de aves que visitaram seu jardim:

``` ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.total
# => 19
```

## 4. Calcule o número de dias ocupados
Alguns dias são mais movimentados que outros. Um dia agitado é aquele em que cinco ou mais pássaros visitaram seu jardim. Implementar o BirdCount#busy_days método para retornar o número de dias ocupados:

``` ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.busy_days
# => 2
```

## 5. Verifique se houve um dia sem visitar pássaros
Implementar o BirdCount#day_without_birds? método que retorna true se houve um dia em que zero pássaros visitaram o jardim; caso contrário, retorne false:

``` ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.day_without_birds?
# => true
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>