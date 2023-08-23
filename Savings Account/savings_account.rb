# The code defines a module called `SavingsAccount` in Ruby. This module contains three methods:
module SavingsAccount
  # Método para calcular a taxa de juros com base no saldo especificado
  def self.interest_rate(balance)
    if balance < 0
      return 3.213  # Retorna a taxa de juros para saldo negativo
    elsif balance < 1000
      return 0.5    # Retorna a taxa de juros para saldo abaixo de $1000
    elsif balance < 5000
      return 1.621  # Retorna a taxa de juros para saldo entre $1000 e $5000
    else
      return 2.475  # Retorna a taxa de juros para saldo acima de $5000
    end
  end

  # Método para calcular a atualização do saldo anual com base na taxa de juros
  def self.annual_balance_update(balance)
    rate = self.interest_rate(balance)                   # Obtém a taxa de juros
    updated_balance = balance + (balance * rate / 100)  # Calcula o novo saldo com juros
    return updated_balance
  end

  # Método para calcular o número de anos necessários para atingir o saldo desejado
  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = self.annual_balance_update(current_balance)  # Atualiza o saldo anualmente
      years += 1  # Incrementa o número de anos
    end
    return years
  end
end

# Exemplos de uso
saldo = 200.75
taxa_de_juros = SavingsAccount.interest_rate(saldo)
puts taxa_de_juros  # Saída: 0.5

saldo_atualizado = SavingsAccount.annual_balance_update(saldo)
puts saldo_atualizado  # Saída: 201.75375

saldo_atual = 200.75
saldo_desejado = 214.88
anos_necessarios = SavingsAccount.years_before_desired_balance(saldo_atual, saldo_desejado)
puts anos_necessarios  # Saída: 14
