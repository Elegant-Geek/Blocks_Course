scores = [83, 71, 92, 64, 98, 87, 75, 69]

# ********************************** Enumerable: Part I **********************************
high_scores = scores.select { |s| s > 80}
puts "High Scores:"
p high_scores 
# prints out: [83, 92, 98, 87]
puts high_scores 
# prints out:  
# 83
# 92
# 98
# 87

low_scores = scores.reject { |s| s > 80}
puts "Low Scores:"
p low_scores 
puts low_scores

puts scores.any? { |s| s < 70} # determines if any score is lower than 70
puts scores.detect { |s| s < 70} #prints the first score lower than 70


# ********************************** Enumerable: Part II **********************************
scores_doubled = scores.map { |initial_score| initial_score * 2} # map is used here to copy original array then double each entry
p scores_doubled

total = scores.reduce(0, :+)
puts "Total score: #{total}"

evens, odds = scores.partition { |score| score.even? }

puts "\nEvens array:"
p evens
puts "\nOdds array:"
p odds

