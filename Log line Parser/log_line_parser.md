# Introdução
Como tudo em Ruby, um String é um objeto. As cordas são compostas de uma sequência arbitrária de bytes ( normalmente caracteres ) e são inicializadas e manipuladas como qualquer outro objeto. De fato, uma das coisas mais úteis sobre o Ruby são os inúmeros métodos que podem ser chamados em cadeias ( e outros objetos ) para economizar muito tempo escrevendo código. Neste exercício, vamos explorar e brincar com alguns desses métodos auxiliares.

## Criando uma string
Embora você possa usar String.new(...) para criar uma string, é muito mais comum usar um literal. Existem muitos literais diferentes que você pode usar - e eles se dividem em duas categorias: aquelas que permitem a interpolação e as que não.

Os literais mais comuns são aspas simples e duplas ('...' e "..."). Aspas simples não permitem a interpolação, enquanto as aspas duplas. Interpolação é onde uma sequência é incluída em outra usando o #{} sintaxe.

```
# Use single quotes when not interpolated
location = 'World'

# And double quotes when interpolated
puts "Hello, #{location}!"   #=> "Hello, World!"
```

Você também pode usar outros literais, como %{... } para cordas interpoladas e %q{...} para cadeias não interpoladas. Estes são úteis se suas strings tiverem os caracteres ' ou " neles.

Nota: Não há uma regra absoluta dizendo que você deve usar seqüências de caracteres não interpoladas se a sequência não contiver interpolação.

## Interagindo com cordas
É útil pensar em Strings in Ruby de maneira semelhante à maneira como você pensa em Arrays. Eles têm um tamanho e seus caracteres são indexados ( com 0 como o primeiro índice ):

```
my_string = "Some string"

my_string.size   #=> 11

my_string[0]    #=> 'S'
my_string[1]    #=> 'o'
my_string[-1]   #=> 'g'

# Find the first index of a character
my_string.index('m')   #=> 2
```

Partes de cadeias podem ser extraídas usando índices ou slice:

```
my_string = "Some string"

# Find three characters starting with the second character (index 1)
my_string[1, 3]         #=> "ome"
my_string.slice(1, 3)   #=> "ome"
```

Os valores semânticos das cordas também podem ser manipulados. Vale a pena explorar o Documentos Ruby para aprender sobre todos os métodos, mas aqui estão alguns exemplos comumente usados:

```
"hello".capitalize   #=> "Hello"
"HELLO".downcase     #=> "hello"
"hello".center(9)    #=> "  hello  "
"  hello  ".strip    #=> "hello"

"hello world".split(" ")   #=> ["hello", "world"]
```

Você também pode usar métodos como gsub para substituir caracteres:

```
# Replace one character with another
"noob".gsub("o","0")   #=> "n00b"

# (Advanced) Replace a regular expression
"Ruby really rocks".gsub(/[aieou]/,'')   #=> "Rby rlly rcks"
```

Em todos os exemplos acima, um novo String é devolvido. No entanto, muitos métodos têm equivalentes que terminam em ! que realmente modifica a própria string.

```
# Use normal methods to return new strings
my_string = "hello"
my_string.capitalize   #=> "Hello"
puts my_string         #=> "hello"

# And bang-methods (...!) to modify the object
my_string = "hello"
my_string.capitalize!  #=> "Hello"
puts my_string         #=> "Hello"
```

# Instruções
Neste exercício, você processará linhas de log.

Cada linha de log é uma sequência formatada da seguinte maneira: "[<LEVEL>]: <MESSAGE>".

Existem três níveis de log diferentes:

INFO
WARNING
ERROR
Você tem três tarefas, cada uma das quais pega uma linha de log e pede que você faça algo com ela. Existem várias maneiras de resolver essas tarefas - escolha seus métodos favoritos nos exemplos acima e veja o que você pode criar.

## 1. Receba mensagem de uma linha de log
Implementar o LogLineParser#message método para retornar a mensagem de uma linha de log:

```
LogLineParser.new('[ERROR]: Invalid operation').message
# => "Invalid operation"
```

Qualquer espaço em branco à frente ou à direita deve ser removido:

```
LogLineParser.new("[WARNING]:  Disk almost full\r\n").message
# => "Disk almost full"
```

## 2. Obter nível de log de uma linha de log
Implementar o LogLineParser#log_level método para retornar o nível de log de uma linha de log, que deve ser retornado em minúsculas:

```
LogLineParser.new('[ERROR]: Invalid operation').log_level
# => "error"
```

## 3. Reformar uma linha de log
Implementar o LogLineParser#reformat método que reformata a linha de log, colocando a mensagem em primeiro lugar e o nível de log após ela entre parênteses:

```
LogLineParser.new('[INFO]: Operation completed').reformat
# => "Operation completed (info)"
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```