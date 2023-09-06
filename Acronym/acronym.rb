class Acronym
  def self.abbreviate(phrase)
    phrase.split(/[\s\-]/).map{|word| word[0]}.join.upcase
  end
end

# Example usage
input_phrase = "Thank George It's Friday!"
output_acronym = Acronym.abbreviate(input_phrase)
puts output_acronym