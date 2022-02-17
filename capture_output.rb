# This nugget effectively redirects Ruby's standard output stream 
# (referenced by the $stdout variable) to a StringIO object 
# for the duration of the block. 
# A StringIO object acts just like other I/O objects, 
# but it writes to a string buffer rather than the console. 
# So any puts calls inside the block are siphoned off into 
# the string buffer rather than printed to the console. 
# The "captured" output is then returned from the method 
# when the block is finished.

require "stringio" # <<<< not so sure what this line does (allows I/O on strings? String buffer?)
# The nugget **************************
def capture_output
    begin
      old_output = $stdout
      $stdout = StringIO.new
      yield
      result = $stdout.string
    ensure
      $stdout = old_output
    end
    result
  end

  # Example block of code to pass into it ***************

output = capture_output do
  puts "Hello!"
  puts "Pleased to meet you."
  puts "Goodbye..."
end

puts output
# NOTE: The output won't actually be printed to the console until the final puts line after the block.

