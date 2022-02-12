class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

flyer = []

1.upto(5) do |number|
    flyer << Flyer.new("Flyer #{number}", "flyer#{number}@example.com", number * 1000 ) #appends each new player to the end of array
end

puts flyer

flyer.each do |flyer|
  puts "#{flyer.name} - #{flyer.miles_flown} miles"
end

total = 0                         # note that this variable "total" will be influenced by the block
flyer.each do |flyer| 
  total += flyer.miles_flown      # the place where the "total" variable has been redefined
end
puts "Total miles flown: #{total}"
# Total miles flown: 15000

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }

# Earn 1.5x miles by flying United!
# Earn 2.0x miles by flying Delta!
# Earn 2.5x miles by flying Lufthansa!

promotions.each do |key, value|
  puts "Earn #{value}x miles by flying #{key}!"
end
