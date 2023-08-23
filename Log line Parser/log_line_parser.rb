# The LogLineParser class is used to parse log lines and extract the log message and log level.
class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    message = @line.split(':', 2) # Divide a linha em duas partes no primeiro ':' encontrado
    message = message[1].strip    # Pega a segunda parte e remove espaços em branco no início e fim
  end

  def log_level
    log_level = @line.gsub("[", "").gsub("]:", "") # Remove colchetes e colons do início do nível de log
    log_level = log_level.split         # Divide a linha em palavras
    log_level = log_level[0].downcase.strip  # Pega a primeira palavra (presumivelmente o nível de log) em letras minúsculas e remove espaços em branco
  end

  def reformat
    message + " (#{log_level})"  # Retorna a mensagem do log seguida pelo nível de log entre parênteses
  end
end
