# Introdução
OpenStruct permite criar facilmente um objeto a partir de Hash. Em vez de ter que acessar usando Hash chaves, OpenStruct em vez disso, permite usar métodos para acessar e definir valores.

``` ruby
attributes = { name: "Jeremy Walker", age: 21, location: "Nomadic" }
person = OpenStruct.new(attributes)

person.name
#=> Jeremy Walker

person.location
#=> Nomadic

# Update the age
person.age = 35

# It sets correctly
person.age
#=> 35
```

Um bônus para essa abordagem é que podemos tirar proveito de um atalho ao usar a sintaxe de bloco. Nas situações em que um bloco chama um único método, você pode substituir o bloco por &: seguido pelo nome do método. Por exemplo, essas duas linhas são sinônimos:

``` ruby
people.sum { |person| person.age }
people.sum(&:age)
```

## Biblioteca padrão
Todas as aulas que você viu em exercícios anteriores fizeram parte da Biblioteca Central de Ruby.

O OpenStruct faz parte da Biblioteca Padrão de Ruby ( frequentemente reduzida para "stdlib" ) - uma coleção de aulas para trabalhar com itens como datas, json e networking. Ele também fornece algumas funcionalidades úteis para facilitar o trabalho do seu código.

Ao usar classes que não são da Biblioteca Central —, seu próprio código em arquivos, classes de stdlib ou dependências externas diferentes —, precisamos importá-las usando o require método antes que possamos usá-los. Por exemplo:

``` ruby
require 'ostruct'

person = OpenStruct.new(name: "Jeremy Walker")
# ...
```

# Instruções
Você continua trabalhando no sistema de gerenciamento de estoque que construiu anteriormente. Desde a descoberta OpenStruct e atalhos de bloco, você decidiu refactar um pouco o código. Em vez de armazenar os itens como hashes, você utilizará suas novas habilidades.

## 1. Permitir recuperação de itens
Você deseja continuar recuperando a lista de itens em estoque, mas desta vez eles devem ser objetos que possam ter métodos chamados.

``` ruby
inventory = BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
])

inventory.items.first.name
# => "Maxi Brown Dress"

inventory.items.first.price
# => 65

inventory.items.size
# => 4
```

Refator item_names para usar o novo atalho de bloco que você aprendeu em vez de hashes. Como lembrete, o método deve retornar:

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

# => ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```

Refator total_stock para usar o novo atalho de bloco que você aprendeu em vez de hashes. Como lembrete, o método deve retornar::

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

# => 36
```

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```