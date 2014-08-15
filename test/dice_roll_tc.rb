require 'minitest/autorun'
 
require_relative '../lib/monopoly_simulator'

class DiceRollTestCase < MiniTest::Unit::TestCase
 
  def test_diceroll_happy_path
    roll = DiceRoll.new
    assert((2..12).include?(roll.value))
  end
 
# Dice roles
#
# 	1  2  3  4  5   6  
# 	-----------------
#1  2  3  4  5  6   7
#2  3  4  5  6  7   8
#3  4  5  6  7  8   9
#4  5  6  7  8  9  10
#5  6  7  8  9  10 11
#6  7  8  9  10 11 12

	def test_dice_roll_distribution
@values = Array.new(100_000) { |_| DiceRoll.new.value }
       @counts = Array.new(13) { 0 }
        @values.each do |v|
	         @counts[v] += 1
	        end
		  
		        def test_one(val)
			         expected_count = { 2 => 1, 3 => 2, 4 => 3, 5 =>4, 6 => 5,
			                             7 =>6, 8=>5, 9=>4, 10=>3, 11=>2, 12=>1 }
				         freq = @values.size * (expected_count[val] /  36.0)
				          delta = freq * 0.10
					         assert((freq - delta) <= @counts[val] && @counts[val] <= (freq + delta))
					        end
						  
						        (2..12).each do |n|
							        test_one(n)
							       end

			assert_equal(0, @counts[0])
			assert_equal(0, @counts[1])
			assert_equal(13, @counts.size)

	end

def test_doubles_distribution
      rolls = Array.new(10_000) { DiceRoll.new }
       doubles_count = 0
	      rolls.each do |roll|
	          if roll.doubles?
		           doubles_count += 1
		          end
			      end
			       expected = rolls.size * (6 / 36.0)
				      delta = expected * 0.1
				       assert((expected - delta) <= doubles_count &&
					             doubles_count <= (expected + delta))
					     end


  def test_diceroll_all_dices
 
#    rolls = []
#    (1..100).each do |n|
#       rolls << DiceRoll.new.value
#    end
 
    values = Array.new(100) { |_| DiceRoll.new.value }

#    (0..99).each do |n|
#      assert((2..12).include?(rolls[n]))
#    end
     assert_equal([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], values.uniq.sort)

  end
end
