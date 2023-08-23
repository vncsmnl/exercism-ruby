# The AssemblyLine class calculates the production rate per hour and the number of working items per
# minute based on the speed of the assembly line.
class AssemblyLine
  def initialize(speed)
    @speed = speed  # Inicializa a velocidade da linha de montagem com o valor fornecido
  end

  def production_rate_per_hour
    case @speed
    when 1..4
      taxa_sucesso = 1.0  # Taxa de sucesso para velocidades de 1 a 4
    when 5..8
      taxa_sucesso = 0.9  # Taxa de sucesso para velocidades de 5 a 8
    when 9
      taxa_sucesso = 0.8  # Taxa de sucesso para velocidade 9
    when 10
      taxa_sucesso = 0.77  # Taxa de sucesso para velocidade 10
    end
    
    taxa_base = 221 * @speed  # Taxa base de produção (velocidade * carros por hora)
    taxa_producao = taxa_base * taxa_sucesso  # Taxa de produção considerando a taxa de sucesso
    taxa_producao.to_f  # Converte para ponto flutuante (Float) e retorna
  end

  def working_items_per_minute
    taxa_producao = production_rate_per_hour  # Obtém a taxa de produção por hora
    itens_por_minuto = (taxa_producao / 60).to_i  # Calcula itens por minuto e converte para inteiro
    itens_por_minuto  # Retorna a quantidade de itens por minuto
  end
end

# Exemplo de uso
linha_de_montagem = AssemblyLine.new(6)
puts "Taxa de produção por hora: #{linha_de_montagem.production_rate_per_hour}"
puts "Itens de trabalho produzidos por minuto: #{linha_de_montagem.working_items_per_minute}"
