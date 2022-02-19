
class DatabaseDriver

  def self.open(database, user, password)
    driver = self.new(database, user, password) #assigning the three parameters before the block into the new driver object
    driver.connect

    return driver unless block_given? # ensures that lines 59-62 can be run ("no block" condition.)

    begin
# To accept a block for the initialization of an object, you need to do what?
# You need to yield the current object (self) to the block, but only if a block is given (see line 13).
        yield(driver)    # <<<<<<<< very important that this name (driver) matches block parameter name |gateway|

    # rescue Exception => e
    #     puts e 
    ensure
    driver.disconnect
    end 
  end 
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end
end

# driver = DatabaseDriver.new("my_database", "admin", "secret")

# driver.connect
# driver.execute("SELECT * FROM ORDERS")
# driver.execute("SELECT * FROM USERS")
# driver.disconnect

  DatabaseDriver.open("my_database", "admin", "secret") do |driver|
    driver.execute("DELETE * FROM ORDERS")
    raise "Boom!" #deliberate error message created
    driver.execute("DELETE * FROM USERS")
  end

driver = DatabaseDriver.open("my_database", "admin", "secret")
driver.execute("SELECT * FROM ORDERS")
driver.execute("SELECT * FROM USERS")
driver.disconnect

# NOTE: Blocks parameters were used/activated/called/setup in this example (unlike sporty_client.rb)