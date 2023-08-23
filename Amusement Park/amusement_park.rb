# The Attendee class represents an attendee with a height attribute and methods to issue and revoke a pass.
class Attendee
  def initialize(height)
    @height = height  # Inicializa a altura do participante com o valor fornecido
  end

  def height
    @height  # Retorna a altura do participante
  end

  def pass_id
    @pass_id  # Retorna o ID do passe do participante
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id  # Atribui um ID ao passe do participante
  end

  def revoke_pass!
    @pass_id = nil  # Revoga o passe do participante (remove o ID do passe)
  end
end
