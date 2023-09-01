# Definindo a exceção personalizada para casos em que um espectador não é membro do clube de cinema
class NotMovieClubMemberError < RuntimeError
end

# Classe Moviegoer representa um espectador de cinema
class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  # Método que determina o preço do ingresso com base na idade do espectador
  def ticket_price
    @age >= 60 ? 10 : 15
  end

  # Método que verifica se o espectador pode assistir a filmes de terror com base na idade
  def watch_scary_movie?
    @age >= 18
  end

  # Método que permite que um espectador membro do clube de cinema reivindique pipoca grátis
  def claim_free_popcorn!
    if @member
      '🍿'
    else
      raise NotMovieClubMemberError
    end
  end
end

# Exemplos de uso
puts Moviegoer.new(21).ticket_price
#=> 15

puts Moviegoer.new(65).ticket_price
#=> 10

puts Moviegoer.new(21).watch_scary_movie?
#=> true

puts Moviegoer.new(17).watch_scary_movie?
#=> false

begin
  puts Moviegoer.new(21, member: true).claim_free_popcorn!
  #=> 🍿
rescue NotMovieClubMemberError
  puts 'Exceção foi lançada! (NotMovieClubMemberError)'
end

begin
  puts Moviegoer.new(17, member: false).claim_free_popcorn!
  #=> Exceção foi lançada! (NotMovieClubMemberError)
rescue NotMovieClubMemberError
  puts 'Exceção foi lançada! (NotMovieClubMemberError)'
end
