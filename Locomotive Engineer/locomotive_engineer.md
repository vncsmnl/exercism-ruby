# Introdução
Decomposição refere-se ao ato de extrair os elementos de uma coleção, como um Array ou Hash. Valores decompostos podem ser atribuídos a variáveis dentro da mesma instrução.

Atribuição múltipla é a capacidade de atribuir várias variáveis para decompor valores em uma instrução. Isso permite que o código seja mais conciso e legível, e é feito separando as variáveis a serem atribuídas com uma vírgula, como first, second, third = [1, 2, 3].

O operador de splat (*) e operador de splat duplo, (**), são frequentemente usados em contextos de decomposição.

Cuidado
*<variable_name> e **<variable_name> não deve ser confundido com * e **. Enquanto * e ** são utilizados para multiplicação e exponenciação, respectivamente, *<variable_name> e **<variable_name> são utilizados como operadores de composição e decomposição.

## Atribuição múltipla
A atribuição múltipla permite atribuir várias variáveis em uma linha. Para separar os valores, use uma vírgula ,:

``` ruby
>> a, b = 1, 2
=> [1, 2]
>> a
=> 1
```

A atribuição múltipla não se limita a um tipo de dados:

``` ruby
>> x, y, z = 1, "Hello", true
=> [1, "Hello", true]
>> x
=> 1
>> y
=> 'Hello'
>> z
=> true
```

Múltiplas atribuições podem ser usadas para trocar elementos em matrizes. Essa prática é bastante comum em algoritmos de classificação. Por exemplo:

``` ruby
>> numbers = [1, 2]
=> [1, 2]
>> numbers[0], numbers[1] = numbers[1], numbers[0]
=> [2, 1]
>> numbers
=> [2, 1]
```

Nota
Isso também é conhecido como "Atribuição Paralela" e pode ser usado para evitar uma variável temporária.

Se houver mais variáveis que valores, as variáveis extras serão atribuídas nil

``` ruby
>> a, b, c = 1, 2
=> [1, 2]
>> b
=> 2
>> c
=> nil
```

## Decomposição
Em Ruby, é possível decompor os elementos de matrizes/hashes em variáveis distintas. Como os valores aparecem dentro matrizes em uma ordem de índice, eles são descompactados em variáveis na mesma ordem:

``` ruby
>> fruits = ["apple", "banana", "cherry"]
>> x, y, z = fruits
>> x
=> "apple"
```

Se houver valores que não são necessários, você poderá usar _ para indicar "coletado, mas não usado":

``` ruby
>> fruits = ["apple", "banana", "cherry"]
>> _, _, z = fruits
>> z
=> "cherry"
```

## Decomposição profunda
Decompor e atribuir valores de matrizes dentro de um matriz (também conhecido como uma matriz aninhada), funciona da mesma maneira que uma decomposição superficial, mas precisa expressão de decomposição delimitada (()) para esclarecer o contexto ou posição dos valores:

``` ruby
>> fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
>> (a, b), (c, d) = fruits_vegetables
>> a
=> "apple"
>> d
=> "potato"
```

Você também pode desfazer a embalagem profunda de apenas uma parte de um aninhado matriz:

``` ruby
>> fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
>> a, (c, d) = fruits_vegetables
>> a
=> ["apple", "banana"]
>> c
=> "carrot"
```

Se a decomposição tiver variáveis com posicionamento incorreto e / ou um número incorreto de valores, você receberá um erro de sintaxe:

``` ruby
fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
(a, b), (d) = fruits_vegetables

syntax error, unexpected ')', expecting '.' or &. or :: or '['
((a, b), (d)) = fruits_vegetables
```

Experimente aqui e você notará que o primeiro padrão determina, não os valores disponíveis no lado direito. O erro de sintaxe não está vinculado à estrutura de dados.

Decompor uma matriz com o operador de splat único (*)
Quando decompondo um matriz você pode usar o operador splat (*) para capturar os valores de "sobras. Isso é mais claro do que fatiar o matriz (que em algumas situações é menos legível). Por exemplo, podemos extrair o primeiro elemento e atribuir os valores restantes em um novo matriz sem o primeiro elemento:

``` ruby
>> fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
>> x, *last = fruits
>> x
=> "apple"
>> last
=> ["banana", "cherry", "orange", "kiwi", "melon", "mango"]
```

Também podemos extrair os valores no início e no final do matriz enquanto agrupa todos os valores no meio:

``` ruby
>> fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
>> x, *middle, y, z = fruits
>> y
=> "melon"
>> middle
=> ["banana", "cherry", "orange", "kiwi"]
```

Também podemos usar * em decomposição profunda:

``` ruby
>> fruits_vegetables = [["apple", "banana", "melon"], ["carrot", "potato", "tomato"]]
>> (a, *rest), b = fruits_vegetables
>> a
=> "apple"
>> rest
=> ["banana", "melon"]
```

## Decompondo um Hash
Decompondo um hash é um pouco diferente de decompor um matriz. Para poder descompactar um hash você precisa convertê-lo em um matriz primeiro. Caso contrário, não haverá decomposição:

``` ruby
>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory
>> x
=> {:apple=>6, :banana=>2, :cherry=>3}
>> y
=> nil
```

Coagir um Hash para um matriz você pode usar o to_a método:

``` ruby
>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> fruits_inventory.to_a
=> [[:apple, 6], [:banana, 2], [:cherry, 3]]
>> x, y, z = fruits_inventory.to_a
>> x
=> [:apple, 6]
```

Se você deseja descompactar as chaves, pode usar o keys método:

``` ruby
>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory.keys
>> x
=> :apple
```

Se você deseja descompactar os valores, pode usar o values método:

``` ruby
>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory.values
>> x
=> 6
```

## Composição
Compor é a capacidade de agrupar vários valores em um matriz isso é atribuído a uma variável. Isso é útil quando você deseja decomposição valores, faça alterações e depois composição os resultados voltam a uma variável. Também possibilita a realização de mesclagens em 2 ou mais matrizes/hashes.

## Composição de uma matriz com operador de splat (*)
Compondo um matriz pode ser feito usando o operador splat, (*). Isso colocará todos os valores em um matriz.

``` ruby
>> fruits = ["apple", "banana", "cherry"]
>> more_fruits = ["orange", "kiwi", "melon", "mango"]

# fruits and more_fruits are unpacked and then their elements are packed into combined_fruits
>> combined_fruits = *fruits, *more_fruits

>> combined_fruits
=> ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
```

## Composição de um hash com operador de splat duplo (**)
A composição de um hash é feita usando o operador de splat duplo (**). Isso vai embalar tudo chave/valor pares de um hash para outro hash ou combine dois hash juntos.

``` ruby
>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> more_fruits_inventory = {orange: 4, kiwi: 1, melon: 2, mango: 3}

# fruits_inventory and more_fruits_inventory are unpacked into key-values pairs and combined.
>> combined_fruits_inventory = {**fruits_inventory, **more_fruits_inventory}

# then the pairs are packed into combined_fruits_inventory
>> combined_fruits_inventory
=> {:apple=>6, :banana=>2, :cherry=>3, :orange=>4, :kiwi=>1, :melon=>2, :mango=>3}
```

Uso de operador de splat (*) e operador de splat duplo (**) com métodos
## Composição com parâmetros do método
Ao criar um método que aceite um número arbitrário de argumentos, você pode usar *arguments ou **keyword_arguments na definição do método. *arguments é usado para empacotar um número arbitrário de argumentos posicionais ( não com palavras-chave ) e **keyword_arguments é usado para empacotar um número arbitrário de argumentos de palavras-chave.

Uso de *arguments:

``` ruby
# This method is defined to take any number of positional arguments
# (Using the single line form of the definition of a method.)

>> def my_method(*arguments)= arguments

# Arguments given to the method are packed into an array

>> my_method(1, 2, 3)
=> [1, 2, 3]

>> my_method("Hello")
=> ["Hello"]

>> my_method(1, 2, 3, "Hello", "Mars")
=> [1, 2, 3, "Hello", "Mars"]
```

Uso de **keyword_arguments:

``` ruby
# This method is defined to take any number of keyword arguments

>> def my_method(**keyword_arguments)= keyword_arguments

# Arguments given to the method are packed into a dictionary

>> my_method(a: 1, b: 2, c: 3)
=> {:a => 1, :b => 2, :c => 3}
```

Se o método definido não tiver parâmetros definidos para argumentos de palavras-chave (**keyword_arguments ou <key_word>: <value>), os argumentos da palavra-chave serão compactados em um hash e atribuídos ao último parâmetro.

``` ruby
>> def my_method(a)= a

>> my_method(a: 1, b: 2, c: 3)
=> {:a => 1, :b => 2, :c => 3}
```

*arguments e **keyword_arguments também pode ser usado em combinação um com o outro:

``` ruby
def my_method(*arguments, **keywword_arguments)
  p arguments.sum
  for (key, value) in keyword_arguments.to_a
    p key.to_s + " = " + value.to_s
  end
end


my_method(1, 2, 3, a: 1, b: 2, c: 3)
6
"a = 1"
"b = 2"
"c = 3"
```

Você também pode escrever argumentos antes e depois *arguments para permitir argumentos posicionais específicos. Isso funciona da mesma maneira que decompor uma matriz.

Cuidado
Os argumentos devem ser estruturados em uma ordem específica:

def my_method(<positional_arguments>, *arguments, <positional_arguments>, <keyword_arguments>, **keyword_arguments)

Se você não seguir esta ordem, receberá um erro.

``` ruby
def my_method(a, b, *arguments)
  p a
  p b
  p arguments
end

my_method(1, 2, 3, 4, 5)
1
2
[3, 4, 5]
```

Você pode escrever argumentos posicionais antes e depois *arguments:

``` ruby
>> def my_method(a, *middle, b)= middle

>> my_method(1, 2, 3, 4, 5)
=> [2, 3, 4]
```

Você também pode combinar argumentos posicionais, * argumentos, argumentos de palavras-chave e ** keyword_arguments:

``` ruby
>> def my_method(first, *many, last, a:, **keyword_arguments)
     p first
     p many
     p last
     p a
     p keyword_arguments
     end

>> my_method(1, 2, 3, 4, 5, a: 6, b: 7, c: 8)
1
[2, 3, 4]
5
6
{:b => 7, :c => 8}
```

Escrever argumentos em uma ordem incorreta resultará em um erro:

``` ruby
def my_method(a:, **keyword_arguments, first, *arguments, last)
  arguments
end

my_method(1, 2, 3, 4, a: 5)

syntax error, unexpected local variable or method, expecting & or '&'
... my_method(a:, **keyword_arguments, first, *arguments, last)
```

## Decomposição em chamadas de método
Você pode usar o operador splat (*) para descompactar um matriz de argumentos em uma chamada de método:

``` ruby
def my_method(a, b, c)
  p c
  p b
  p a
end

numbers = [1, 2, 3]
my_method(*numbers)
3
2
1
```

Você também pode usar operador de splat duplo (**) para descompactar um hash de argumentos em uma chamada de método:

``` ruby
def my_method(a:, b:, c:)
  p c
  p b
  p a
end

numbers = {a: 1, b: 2, c: 3}
my_method(**numbers)
3
2
1
```

# Instruções
Seu amigo Linus é um engenheiro de locomotivas que dirige trens de carga entre cidades. Embora sejam surpreendentes no manuseio de trens, eles não são surpreendentes no manuseio de logística ou computadores. Eles gostariam de alistar sua programação para organizar detalhes do trem e corrigir erros nos dados da rota.

Nota
Este exercício pode ser facilmente resolvido usando fatias, indexações e vários hash métodos. No entanto, gostaríamos que você praticasse embalagem, desembalagem e várias tarefas na solução de cada uma das tarefas abaixo.

## 1. Crie uma lista de todos os vagões
Seu amigo tem acompanhado cada identificador de vagão ( ID ), mas eles nunca sabem ao certo quantos vagões o sistema terá que processar a qualquer momento. Seria muito mais fácil para o restante do programa de logística colocar esses dados em um sistema unificado matriz.

Implementar um método generate_list_of_wagons() que aceita um número arbitrário de IDs de vagão. Cada ID será um número inteiro positivo. O método deve então return os IDs fornecidos como um único matriz.

``` ruby
LocomotiveEngineer.generate_list_of_wagons(1, 7, 12, 3, 14, 8, 5)
# => [1, 7, 12, 3, 14, 8, 5]
```

## 2. Corrigir a lista de vagões
Neste ponto, você está começando a ter uma ideia dos dados e de como eles são usados no programa de logística. O sistema de identificação sempre atribui à locomotiva um ID de 1, com o restante dos vagões no trem atribuído um ID escolhido aleatoriamente maior que 1.

Seu amigo teve que conectar dois novos vagões ao trem e esqueceu de atualizar o sistema! Agora, os dois primeiros vagões no trem matriz precisa ser movido para o final, ou tudo estará fora de ordem.

Para tornar as coisas mais complicadas, seu amigo descobriu um segundo matriz que parece conter IDs de vagão ausentes. Tudo o que eles conseguem se lembrar é que, uma vez movidos os novos vagões, os IDs deste segundo matriz deve ser colocado diretamente após a locomotiva designada.

Linus ficaria muito grato a você por corrigir seus erros e consolidar os dados.

Implementar um método fix_list_of_wagons() leva dois matrizes contendo IDs de vagão. Deve reposicionar os dois primeiros itens do primeiro matriz até o final e insira os valores a partir do segundo matriz atrás (no lado direito de) o ID da locomotiva (1). O método deve então return uma matriz com as modificações.

``` ruby
LocomotiveEngineer.fix_list_of_wagons([2, 5, 1, 7, 4, 12, 6, 3, 13], [3, 17, 6, 15])
# => [1, 3, 17, 6, 15, 7, 4, 12, 6, 3, 13, 2, 5]
```

## 3. Adicionar paradas ausentes
Agora que todos os dados do vagão estão corretos, Linus gostaria que você atualizasse as informações de roteamento do sistema. Ao longo de uma rota de transporte, um trem pode fazer paradas em algumas estações diferentes para pegar e / ou deixar a carga. Cada viagem pode ter uma quantidade diferente desses pontos de entrega intermediários. Seu amigo gostaria que você atualizasse o roteamento de sistemas hash com qualquer informação de entrega ausente / adicional.

Implementar um método add_missing_stops() que aceita um roteamento hash seguido por um número variável de argumentos de palavras-chave. Esses argumentos podem ter a forma de um hash segurando uma ou mais paradas ou qualquer número de stop_<number>: "city" pares de palavras-chave. Seu método deve retornar o roteamento hash atualizado com um adicional chave que possui um matriz de todas as paradas adicionadas em ordem.

``` ruby
LocomotiveEngineer.add_missing_stops({from: "New York", to: "Miami"},
                    stop_1: "Washington, DC", stop_2: "Charlotte", stop_3: "Atlanta",
                    stop_4: "Jacksonville", stop_5: "Orlando")
# => {from: "New York", to: "Miami", stops: ["Washington, DC", "Charlotte", "Atlanta", "Jacksonville", "Orlando"]}
```

## 4. Ampliar informações de roteamento
Linus tem trabalhado no programa de roteamento e percebeu que certas rotas estão faltando alguns detalhes importantes. As informações iniciais da rota foram construídas como um hash e seu amigo gostaria que você atualizasse isso hash com o que quer que esteja faltando. Cada rota do sistema requer detalhes ligeiramente diferentes, portanto Linus realmente prefere uma solução genérica.

Implementar um método chamado extend_route_information() que aceita dois hashes. O primeiro hash contém as cidades de origem e destino entre as quais a rota de trem se estende.

O segundo hash contém outros detalhes de roteamento, como velocidade, comprimento ou temperatura do trem. O método deve retornar um consolidado hash com todas as informações de roteamento.

Nota
O segundo hash pode conter propriedades diferentes / mais do que as mostradas no exemplo.

``` ruby
LocomotiveEngineer.extend_route_information({"from": "Berlin", "to": "Hamburg"}, {"length": "100", "speed": "50"})
# => {"from": "Berlin", "to": "Hamburg", "length": "100", "speed": "50"}
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>