# The SimpleCalculator class provides a method to perform basic arithmetic calculations with two
# operands and an operation.
class SimpleCalculator
  class UnsupportedOperation < StandardError
  end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.class == String || second_operand.class == String
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation
    
    begin
    "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end
end