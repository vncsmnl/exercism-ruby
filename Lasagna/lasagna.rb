# The Lasagna class calculates the remaining minutes in the oven, the preparation time in minutes, and the total time in minutes for cooking lasagna.
class Lasagna
  EXPECTED_MINUTES_IN_OVEN = 40  # Tempo esperado em minutos no forno
  LAYER_PREP_TIME = 2  # Tempo de preparação por camada em minutos
  
  # Calcula quantos minutos restantes no forno com base nos minutos já passados
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  # Calcula o tempo de preparação total com base no número de camadas
  def preparation_time_in_minutes(layers)
    layers * LAYER_PREP_TIME
  end

  # Calcula o tempo total, somando o tempo de preparação e os minutos no forno
  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end

