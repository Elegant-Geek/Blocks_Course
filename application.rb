class Application
  attr_accessor :environment

  def initialize
    @environment = :development
  end

  def connect_to_database
    puts "Connecting to #{@environment} database..."
  end

  def handle_request
    puts "Handling #{@environment} request..."
  end

  def write_to_log
    puts "Writing to #{@environment} log file..."
  end

    def in_environment(new_environment)
        old_environment = @environment #assign current environment (development) to "old"
        @environment = new_environment     #reassign development to production
        yield                          #call block
    rescue Exception => e
        puts e.message
    ensure
        @environment = old_environment #reset it back to initial environment (development). Ensure means "reset it no matter what happens"
        puts "Reset environment to #{@environment}"
    end
end

# app.in_production do
#   app.connect_to_database
#   app.handle_request
#   raise "Boom" #deliberately creates runtime error
#   app.write_to_log
# end

app = Application.new

app.in_environment(:production) do
    app.connect_to_database
    app.handle_request
    app.write_to_log
  end
  
  app.in_environment(:test) do
    app.connect_to_database
    app.handle_request
    app.write_to_log
  end
