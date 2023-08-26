# The BirdCount class provides methods to analyze bird counts, including retrieving counts from the
# previous week, getting the count for yesterday, calculating the total count for the week, counting
# the number of busy days (with 5 or more birds), and checking if there was a day without any bird
# visits.
class BirdCount
  # Retorna as contagens da semana passada
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  # Inicializa a classe com as contagens diárias de pássaros
  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  # Retorna o número de pássaros que visitaram o jardim ontem
  def yesterday
    @birds_per_day[-2] # Ontem é o penúltimo elemento
  end

  # Calcula o número total de aves visitantes durante a semana
  def total
    @birds_per_day.sum
  end

  # Calcula o número de dias ocupados (com 5 ou mais pássaros)
  def busy_days
    @birds_per_day.count { |count| count >= 5 }
  end

  # Verifica se houve um dia sem visitar pássaros (contagem 0)
  def day_without_birds?
    @birds_per_day.include?(0)
  end
end

# Dados de exemplo
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)

# Imprime os resultados
puts "Contagens da semana passada: #{BirdCount.last_week}"
puts "Pássaros visitaram ontem: #{bird_count.yesterday}"
puts "Total de aves visitantes: #{bird_count.total}"
puts "Dias ocupados: #{bird_count.busy_days}"
puts "Dia sem visitar pássaros: #{bird_count.day_without_birds?}"