# The Attendee class represents an attendee at an amusement park and provides methods to issue and
# revoke passes, check if the attendee has a pass, and determine if the attendee fits the height
# requirement for a ride.
class Attendee
  def initialize(height)
    @height = height  # Inicializa a altura do participante
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id  # Atribui um ID ao passe do participante
  end

  def revoke_pass!
    @pass_id = nil  # Revoga o passe do participante (remove o ID do passe)
  end

  # Não edite os métodos acima, adicione seus próprios métodos abaixo.

  def has_pass?
    @pass_id != nil  # Verifica se o participante possui um passe válido
  end

  def fits_ride?(ride_minimum_height)
    ride_minimum_height <= @height  # Verifica se a altura do participante é adequada para o brinquedo
  end

  def allowed_to_ride?(ride_minimum_height)
    @pass_id != nil && fits_ride?(ride_minimum_height)  # Verifica se o participante pode andar no brinquedo com base no passe e na altura
  end
end
