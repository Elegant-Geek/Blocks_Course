# The timeout method takes a parameter for the timeout duration 
# (in seconds) and a block of code to execute. Like 2.0 here.
# If the block completes before the timeout duration expires, 
# then the timeout method returns the value returned by the block. 
# Otherwise, if the timeout duration expires before the block completes, 
# the timeout method raises a Timeout::Error exception.

require 'timeout'

def try_with_timeout(timeout_duration)
    begin
      Timeout.timeout(timeout_duration) do
        yield # no block parameter used, so just "yield" goes here.
      end
    rescue Timeout::Error
      # handle it however you like!
      puts "Took too long!"
    end
  end

# puts "this code runs fine:"
# Timeout.timeout(2.0) do
#   sleep 1.0
#   puts "That was refreshing..."
# end
# puts "this code does not run fine (and prints an error):"
# Timeout.timeout(2.0) do
#     sleep 3.0
#     puts "That was refreshing..."
# end


# code that is in a block and gets passed into YIELD
try_with_timeout(2.0) do
    sleep 1.0
    puts "That was refreshing..."
end

try_with_timeout(2.0) do
    sleep 3.0
    puts "Yawn..."
end


# CODE TO RUN AND TRY AND OPEN A WEBPAGE IN LESS THAN ONE SECOND
# require 'open-uri'
# web_page = try_with_timeout(1.0) do
#   URI.open("http://example.com/")
# end

# puts web_page.read