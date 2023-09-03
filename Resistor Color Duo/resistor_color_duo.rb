# The ResistorColorDuo class converts the first two colors in an array into their corresponding
# resistance value.
class ResistorColorDuo
  def self.value(array)
    # Define um array de nomes de cores na mesma ordem que seus valores
    colors = %w[black brown red orange yellow green blue violet grey white]
    
    # Pega os dois primeiros elementos do array de entrada e converte-os em índices
    # no array 'cores' usando o método 'find_index'.
    indices = array.take(2).map { |color| colors.find_index(color) }
    
    # Junta os índices como strings e converte-os em um número inteiro para obter o valor da resistência.
    resistance_value = indices.join.to_i
    
    # Retorna o valor da resistência como um número inteiro.
    return resistance_value
  end
end

puts ResistorColorDuo.value(['brown', 'green'])  # Output: 15
puts ResistorColorDuo.value(['brown', 'green', 'violet'])  # Output: 15