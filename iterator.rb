# *********************** Santa's Iterator ****************************
# def three_times
#     yield
#     yield
#     yield
# end

# three_times { puts "Ho!" }

# output
# Ho!
# Ho!
# Ho!

# *********************** Workout Iterator ****************************

def three_times 
    yield (1)
    yield (2)
    yield (3)
end
three_times do |number|
    puts "#{number} situp"
    puts "#{number} pushup"
    puts "#{number} chinup"
  end

  # *********************** Workout Iterator 2 ****************************

def two_times 
    1.upto(2) do |count| #using upto method to pass each iteration number into the yield block.
        yield(count)
    end
end
two_times do |number|
    puts "#{number} situp"
    puts "#{number} pushup"
    puts "#{number} chinup"
  end