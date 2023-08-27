# The BoutiqueInventory class represents an inventory of items in a boutique, with methods to retrieve
# item names and calculate the total stock.
require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    # Cria uma instância de BoutiqueInventory com base nos dados dos itens fornecidos
    # Os itens são convertidos em objetos OpenStruct para permitir o acesso a atributos e métodos
    @items = items.map { |item_data| OpenStruct.new(item_data) }
  end

  def item_names
    # Mapeia os nomes dos itens usando a função map com o atalho &:name
    # Os nomes são então ordenados alfabeticamente e retornados como uma lista
    items.map(&:name).sort
  end

  def total_stock
    # Calcula o total de estoque somando as quantidades de cada tamanho de todos os itens
    total = items.sum { |item| item.quantity_by_size.values.sum }
    total  # Retorna o total calculado
  end
end

dados_itens = [
  { price: 65.00, name: "Maxi Brown Dress", quantity_by_size: { s: 3, m: 7, l: 8, xl: 4 } },
  { price: 50.00, name: "Red Short Skirt", quantity_by_size: {} },
  { price: 29.99, name: "Black Short Skirt", quantity_by_size: { s: 1, xl: 4 } },
  { price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: { s: 7, m: 2 } }
]

inventory = BoutiqueInventory.new(dados_itens)

# Exemplos de uso dos métodos da classe

puts inventory.items.first.name
# => "Maxi Brown Dress"

puts inventory.items.first.price
# => 65.0

puts inventory.items.size
# => 4

puts inventory.item_names.inspect
# => ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]

puts inventory.total_stock
# => 36
