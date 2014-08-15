class DiceRoll
 
#  def value
#    rand(11) + 2
#  end
 attr_reader :value

 def doubles?
	@are_equal
 end

 def initialize
	d1= rand(6) + 1
	d2 = rand(6) + 1
	@value = d1 + d2
	@are_equal = (d1==d2)
 end
end 
