require 'minitest'  # => true
# require_relative '../enumerables'

class EnumerablesTest < Minitest::Test  # => Minitest::Test

  def test_select_returns_values_for_any_that_have_that_condition
    even_array = [2,6,8,10,12]
    odd_array = [1,5,7,9,15,21]
    assert_equal [2,6,8,10,12], even_array.select{|num| num % 2 == 0 }
    assert_equal [], odd_array.select{|num| num % 2 == 0}
  end                                                # => :test_any_returns_true_or_false_if_any_have_that_condition

  def test_any_returns_true_or_false_if_any_have_that_condition
    short_words = ["a", "be", "dog"]
    refute short_words.any?{|word| word.length > 4}

    odd_array = [1,3,5,21]

    refute odd_array.any?{|num| num.even?}
  end

  def test_map_changes_values_in_array_by_block_argument
    array = [0,2,4,6]

    assert_equal [0,4,8,12], array.map {|value| value * 2}
  end


end  # => :test_any_returns_true_or_false_if_any_have_that_condition

  def any?(array, &block)
    flag = false
    array.each do |value|
      flag = true if array.include? block.call(value)
    end
    flag
  end                               # => :our_any?

  def select(array, &block)
    new_array = []
    array.each {|value| new_array << value if block.call(value)}
    new_array
  end

  def map(array, &block)
    new_array = []                  # => []
    array.each do |num|             # => [1, 2, 3]
      new_array << block.call(num)  # => [2], [2, 4], [2, 4, 6]
    end                             # => [1, 2, 3]
    new_array                       # => [2, 4, 6]
  end
                                                  # => :select
