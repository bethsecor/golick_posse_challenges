require_relative '../turing_towers'

require 'pry'
class TuringTowersTest < Minitest::Test
  def test_pass_a_starting_rod_of_1
    turing_tower = TuringTowers.new(1)
    turing_tower.pass_disc
    assert_equal 0, turing_tower.initial_array.count
    assert_equal 1, turing_tower.final_array.count
    assert_equal [1], turing_tower.final_array
  end

  def test_pass_a_starting_rod_of_2
    turing_tower = TuringTowers.new(2)
    turing_tower.start_game
    assert_equal 0, turing_tower.initial_array.count
    assert_equal 2, turing_tower.final_array.count
    assert_equal [1,2], turing_tower.final_array
  end
end
