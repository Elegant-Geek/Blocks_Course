puts "Let's start mastering Ruby blocks!"

puts "\n3.times do (exercise)"
3.times do |num|
    puts "\n#{num} situp \n#{num} pushup \n#{num} chinup"
end
puts "\n1.upto(3) do (exercise)"
1.upto(3) do |num|
    puts "\n#{num} situp \n#{num} pushup \n#{num} chinup"
end

puts "\nstep by every 2 do (exercise)"
# This is the step method where range is 1 up to 10, by skipping every 2nd number (prints 1,3,5,7,9)
1.step(10, 2) { |num| puts "\n#{num} situp \n#{num} pushup \n#{num} chinup"}

puts "\nalligator multi-line code"
# multi line version
1.upto(3) do |count|
    puts "#{count} alligator"
  end
puts "\nalligator single line code"
# single line version
1.upto(3) { |count| puts "#{count} alligator" }