# Introdução
Símbolos personagem, p. . Eles também permitem ser escritos com aspas, por exemplo. , que permite, por exemplo, espaços no nome.são identificadores nomeados que podem ser usados para se referir a um valor. Os símbolos são criados através de um símbolo literal, que é prefixando um nome com um ::foo:"foo"

``` ruby
:foo # => :foo
:"foo boo" # => :"foo boo"
```

Os símbolos são usados em muitos lugares do idioma, inclusive como chaves nos hashes, para representar nomes de métodos e nomes de variáveis.

## Identificador
O que diferencia os símbolos das strings é que eles são identificadores e não representam dados ou texto. Isso significa que dois símbolos com o mesmo nome são sempre o mesmo objeto.

``` ruby
"foo".object_id # => 60
"foo".object_id # => 80
:foo.object_id # => 1086748
:foo.object_id # => 1086748
```

## Símbolos de modificação
Os símbolos são imutáveis, o que significa que eles não podem ser modificados. Isso significa que quando você "modifica" um símbolo, está realmente criando um novo símbolo. Existem alguns métodos que podem ser usados para manipular símbolos, todos eles retornam novos símbolos. Todos os métodos podem ser encontrados no API de símbolo.

``` ruby
:foo.upcase # => :FOO

:foo.object_id # => 1086748
:foo.upcase.object_id # => 60
```

O benefício de os símbolos serem imutáveis é que eles são mais eficientes em memória do que as strings, mas também mais seguros de usar como identificadores.

## Conversão
Os símbolos podem ser convertidos em strings e vice-versa. Isso pode ser útil quando você deseja modificar um símbolo ou quando deseja usar um símbolo como uma sequência. Para apresentar um símbolo como uma sequência, você pode usar o String#to_sym método e para fazer o oposto, você pode usar o Symbol#to_s método. Devido aos símbolos com um conjunto limitado de métodos, pode ser útil converter um símbolo em uma sequência para usar métodos de sequência, se for necessário um novo símbolo.

``` ruby
:foo.to_s # => "foo"
"foo".to_sym # => :foo
```

# Instruções
O porto de Palermo é um porto movimentado, com muitos navios indo e vindo. Há muito tempo, possui um sistema manual para acompanhar os navios que estão atualmente no porto. Esse sistema é muito propenso a erros e o chefe do porto decidiu substituí-lo por um sistema computadorizado.

O chefe do porto contratou você para implementar o novo sistema. O sistema precisa lidar com identificadores para navios, mas também para destinos.

## 1. Crie o identificador de portas
A primeira coisa que você precisa fazer é criar o identificador para o porto de Palermo. O identificador são as quatro primeiras letras do nome da porta, em maiúsculas.

Definir o Port::IDENTIFIER constante para ser um símbolo com o valor :PALE.

``` ruby
Port::IDENTIFIER 
# => :PALE
```

## 2. Obter identificadores para outras portas
O programa também precisará lidar com outras portas, portanto, você também precisará criar identificadores para elas. A porta gostaria que o sistema fosse automatizado e, como as portas usam convenções de nomenclatura diferentes, os identificadores devem ser gerados a partir do nome da porta. O identificador são as quatro primeiras letras do nome da porta, em maiúsculas.

Definir o Port.get_identifier método para pegar uma sequência como argumento e retorna o identificador como um símbolo para essa porta.

``` ruby
Port.get_identifier("Hamburg") 
# => :HAMB
```

## 3. Determine em qual terminal um navio deve atracar
O porto possui dois terminais e o sistema precisa determinar em qual terminal um navio deve atracar. O terminal é determinado pelo identificador do navio.

O identificador é construído com 2 partes, a primeira parte é composta por 3 letras maiúsculas que indicam qual carga o navio está transportando, e depois 3 números, que é o identificador exclusivo do navio.

Se o identificador do navio estiver carregando: ÓLEO ou GÁS o navio deve atracar no terminal A. Senão o navio deve atracar no terminal B.

Definir o Port.get_terminal método para tomar um símbolo como argumento que é o identificador do navio. O método deve retornar o terminal como um símbolo.

``` ruby
Port.get_terminal(:OIL123)
# => :A
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```