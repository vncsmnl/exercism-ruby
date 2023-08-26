# The `BoutiqueInventory` class manages the inventory of items in a boutique, providing methods to
# retrieve item names, find cheap items, check for out of stock items, get stock for a specific item,
# and calculate the total stock.
class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    # Mapeia os nomes dos itens e ordena alfabeticamente
    @items.map { |item| item[:name] }.sort
  end

  def cheap
    # Seleciona itens com preço menor que 30
    @items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    # Seleciona itens que estão fora de estoque (sem tamanhos no estoque)
    @items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    # Encontra o item pelo nome e retorna seu estoque por tamanho
    item = @items.find { |item| item[:name] == name }
    item ? item[:quantity_by_size] : nil
  end

  def total_stock
    total = 0
    @items.each do |item|
      # Calcula o total de estoque somando as quantidades por tamanho
      total += item[:quantity_by_size].values.sum
    end
    total
  end
end

# Exemplo de uso
inventory = BoutiqueInventory.new([
  { price: 65.00, name: "Maxi Brown Dress", quantity_by_size: { s: 3, m: 7, l: 8, xl: 4 } },
  { price: 50.00, name: "Red Short Skirt", quantity_by_size: {} },
  { price: 29.99, name: "Black Short Skirt", quantity_by_size: { s: 1, xl: 4 } },
  { price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: { s: 7, m: 2 } }
])

# Imprime os resultados
puts inventory.item_names
puts inventory.cheap
puts inventory.out_of_stock
puts inventory.stock_for_item("Black Short Skirt")
puts inventory.total_stock
