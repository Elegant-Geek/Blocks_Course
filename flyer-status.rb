# ********************************** Enumerable: Part I **********************************
class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

freq_flyers = flyers.select { |f| f.miles_flown >= 3000 }
puts freq_flyers 

infreq_flyers = flyers.reject { |f| f.miles_flown >= 3000 }
puts infreq_flyers 
puts "\nAre there any bronze flyers?"
puts flyers.any? { |f| f.status == :platinum}
puts "\nWho is the first one?"
puts flyers.detect { |f| f.status == :bronze} #prints the first bronze player it finds

# ********************************** Enumerable: Part II **********************************
platinum, other = flyers.partition { |f| f.status == :platinum }

puts "\nPlatinum Flyers:"
puts platinum
puts "\nOther Flyers:"
puts other

tags = flyers.map { |f| "#{f.name} (#{f.status.upcase})"}
puts "\n#{tags}" #sorry I just wanted to do a new line break

Lufthansa_km = flyers.map { |f| "#{f.name} (#{f.miles_flown * 1.6} miles flown)"}
puts "\nLufthansa list of flyers by miles:"
puts Lufthansa_km

#stringing together .map and .reduce methods (kilometers)
km_total = flyers.map { |flyer| flyer.miles_flown * 1.6 }.reduce (:+) 
puts "\nTotal flyer distance: #{km_total} (km)"
#stringing together .map and .reduce methods (miles)
mi_total = flyers.map { |flyer| flyer.miles_flown }.reduce (:+) 
puts "Total flyer distance: #{mi_total} (mi)"

#Tally up all the kilometers flown by bronze flyers
bronze_km_total = flyers.select { |f| f.status == :bronze}.map { |f| f.miles_flown * 1.6}.reduce(:+)
puts "\nTotal distance for all bronze flyers:#{bronze_km_total}"

#displays the flyer with the most distance
top_flyer = flyers.max_by { |f| f.miles_flown }
puts "\nTop Flyer: #{top_flyer}"

#displays the flyer with the least distance
least_flyer = flyers.min_by { |f| f.miles_flown }
puts "Least Miles Flyer: #{least_flyer}"