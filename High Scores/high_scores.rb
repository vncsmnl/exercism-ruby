# The HighScores class allows you to track and retrieve information about a list of scores, such as
# the highest score, the last added score, and the three highest scores.
# Define a HighScore class
class HighScores
  # Constructor to initialize the scores array
  def initialize(scores)
    @scores = scores
  end

  # Method to return the highest score
  def highest
    @scores.max
  end

  # Method to return the last added score
  def last_added
    @scores.last
  end

  # Method to return the three highest scores
  def top_three
    @scores.sort.reverse[0..2]
  end
end

# Example usage:
# Instantiate the HighScore class with an array of scores
scores = [100, 75, 95, 88, 120, 60]
high_scores = HighScores.new(scores)

# Get the highest score
puts "Highest Score: #{high_scores.highest}"

# Get the last added score
puts "Last Added Score: #{high_scores.last_added}"

# Get the three highest scores
puts "Top Three Scores: #{high_scores.top_three}"
