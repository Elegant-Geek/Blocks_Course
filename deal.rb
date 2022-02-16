def deal
    faces = ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
    # call the block here
    if block_given?
        random_face = faces.sample
        random_suit = suits.sample
        score = yield random_face, random_suit #stores result
        puts "You scored a #{score}!" #prints result
      else
        puts "No deal!"
      end

end

deal do |face, suit|
    puts "Dealt a #{face} of #{suit}"
    face.length + suit.length
    end

deal


# *******************************************
def progress
    0.step(100, 10) do |number|
      yield number
    end
  end

progress { |percent| puts percent }
