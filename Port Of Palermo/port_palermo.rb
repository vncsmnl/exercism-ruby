# The code defines a Ruby module called "Port". Inside the module, there are two methods:
# "get_identifier" and "get_terminal".
module Port
  # Definindo a constante IDENTIFIER para o Porto de Palermo
  IDENTIFIER = :PALE

  # Método para obter o identificador de um porto com base no nome da cidade
  def self.get_identifier(city)
    identifier = city[0, 4].upcase.to_sym
    # Pegando as quatro primeiras letras da cidade, transformando em maiúsculas e convertendo para um símbolo
  end

  # Método para determinar o terminal de atracação com base no identificador do navio
  def self.get_terminal(ship_identifier)
    cargo_type = ship_identifier.to_s[0, 3].upcase
    # Obtendo as três primeiras letras do identificador do navio, transformando em maiúsculas
    if cargo_type == "OIL" || cargo_type == "GAS"
      terminal = :A
      # Se o tipo de carga for OIL ou GAS, o navio atraca no terminal A
    else
      terminal = :B
      # Caso contrário, o navio atraca no terminal B
    end
  end
end
