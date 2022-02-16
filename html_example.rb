require 'benchmark'
# SOLUTION #1 *****************************************************
def h1
    result = yield
    puts "<h1>#{result}</h1>"
end

h1 { "Breaking News!" }
# expected output:
# <h1>Breaking News!</h1>

# SOLUTION #2 *****************************************************
def h2
    print "<h2>"
    print yield
    print "</h2>"
end

h2 { "Breaking News!" }
# expected output:
# <h2>Breaking News!</h2>

puts "\ndefining a tag method"

def tag (tag)
    print "\n<#{tag}>"
    print yield
    print "</#{tag}>"
end

tag(:h1) { "Breaking News!" }
tag(:h2) { "Massive Ruby Discovered" }

tag(:ul) do
    tag(:li) { "It sparkles!"}
    tag(:li) { "It shines!"}
    tag(:li) { "It mesmerizes!"}
  end

# DEBUGGING EXAMPLE 1 *******************************

def with_debugging
    puts "Got Here!"
    result = yield
    puts "Result was #{result}"
end
  with_debugging do
    magic_number = (23 - Time.now.hour) * Math::PI #varying code line that needs debugging!
  end

  

# DEBUGGING EXAMPLE 2 *******************************
puts "Here is an example of a debugger that shows the expected value if test fails!"

def with_expectation(value) 
    puts "Running test..."
    result = yield
    if result == value 
        puts "Passed"
    else 
        puts "Failed"
        puts "Expected #{value}, got #{result}"
    end
end
with_expectation(5) { 2 + 2 }


def time_it(name)
    elapsed_time = Benchmark.realtime do
      yield
    end
    puts "#{name} took #{elapsed_time} seconds."
  end

  time_it("Sleepy code") do
    # run some code
    sleep(2)
  end