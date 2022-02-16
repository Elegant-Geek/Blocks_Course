# cards.rb

cards = ["Jack", "Queen", "King", "Ace", "Joker"]

cards.shuffle.each { |c| puts "#{c.upcase} - #{c.length} "}

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}
scores.each { |k, v| puts "#{k} scored a #{v}!" }
# Larry scored a 10!
# Moe scored a 8!
# Curly scored a 12!