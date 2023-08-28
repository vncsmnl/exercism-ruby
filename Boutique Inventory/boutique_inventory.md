# Introdução
## Métodos de enumeração
Em Bird Count, você foi apresentado ao count, any?, select, all e map métodos de enumeração. Aqui está uma recapitulação desses, com alguns extras adicionados:

``` ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number > 20 }   #=> false
fibonacci.none?  { |number| number > 20 }   #=> true
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
fibonacci.select { |number| number >= 5}    #=> [5, 8, 13]
fibonacci.find   { |number| number >= 5}    #=> 5

# Some methods work with or without a block
fibonacci.sum  #=> 33
fibonacci.sum {| number | number * number }  #=> 273

# There are also methods to help with nested arrays:
animals = [ ['cat', 'bob'], ['horse', 'caris'], ['mouse', 'arya'] ]
animals.flatten  #=> ["cat", "bob", "horse", "caris", "mouse", "arya"]
```

## Hastes enumerativas
Enumerando Hash objetos é exatamente o mesmo que enumerar Array objetos, exceto que o bloco recebe dois argumentos: a chave e o valor:

``` ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.each { |animal, name| ... }
```

Se você precisar apenas de um dos valores, poderá usar o especial _ símbolo para indicar que um valor não é necessário. Isso ajuda tanto em termos de clareza do desenvolvedor quanto também é uma otimização de desempenho.

``` ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.map { |_, name| name }  #=> ["bob, "caris", "arya"]
```

## Enumerações aninhadas
Você também pode enumerar em blocos aninhados e métodos de cadeia de margaridas juntos. Por exemplo, se temos uma variedade de hashes de animais e queremos extrair os animais com nomes curtos, podemos fazer algo como:

``` ruby
pets = [
  { animal: "cats", names: ["bob", "fred", "sandra"] },
  { animal: "horses", names: ["caris", "black beard", "speedy"] },
  { animal: "mice", names: ["arya", "jerry"] }
]

pets.map { |pet|
  pet[:names].select { |name| name.length <= 5 }
}.flatten.sort
#=> ["arya", "bob", "caris", "fred", "jerry"]
```

# Instruções
Você administra uma boutique de moda online. Sua grande venda anual está chegando, então você deseja criar algumas funcionalidades para ajudá-lo a fazer um balanço do seu inventário para garantir que você esteja pronto.

Um único item no inventário é representado por um hash, e todo o inventário é uma matriz desses hashes.

``` ruby
[
  {
    name: "White Shirt",
    price: 40,
    quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}
  },
  { ... }
]
```

## 1. Retornar uma lista dos nomes dos itens
Implementar BoutiqueInventory.item_names, que deve retornar uma lista dos nomes dos itens solicitados em ordem alfabética.

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

#=> ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```

## 2. Devolva todos os itens baratos
Implementar BoutiqueInventory.cheap que deve devolver itens que custem menos de $ 30.

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).cheap

# => [
#      {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
#      {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
#    ]
```

## 3. Devolva todos os itens que estão fora de estoque
Implementar BoutiqueInventory.out_of_stock que deve devolver quaisquer itens que não tenham estoque ( em que quantity_by_size está vazio ).

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).out_of_stock

#=> [{price: 50.00, name: "Red Short Skirt", quantity_by_size: {}}]
```

## 4. Devolver o estoque de um único item
Implementar BoutiqueInventory.stock_for_item(name) devolver o estoque de um item pelo nome:

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).stock_for_item("Black Short Skirt")

#=> {s: 1, xl: 4}
```

## 5. Retorne o estoque total
Implementar BoutiqueInventory.total_stock para calcular a quantidade total de itens na sua despensa:

``` ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

#=> 36
```

# Como depurar
Quando um teste falha, uma mensagem é exibida descrevendo o que deu errado e para qual entrada. Você pode inspecionar valores arbitrários em seu programa passando-os para o debug método. Isso capturará os valores e mostrará a saída.

``` ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```

<div><img align="right" src="../assets/my_machine.png" alt="my_machine" width="200"></div>