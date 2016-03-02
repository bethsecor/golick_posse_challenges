require 'pry'

class TuringTowers
  attr_reader :initial_array,
              :passing_array,
              :final_array,
              :initial_size

  def initialize(initial_size)
    @initial_array =* (1..initial_size)
    @final_array = []
    @passing_array = []
    @initial_size = initial_size
  end

  def pass_disc(options = {})
    unless final_array.count == initial_size
      if odd?(initial_array)
        pass_disc(from: initial_array, to: final_array)
        pass_disc(from: initial_array, to: passing_array) if !initial_array.empty?
        final_array, initial_array = initial_array, final_array
      else # array is even
        pass_disc(from: initial_array, to: passing_array)
        pass_disc(from: initial_array, to: final_array)
      end
    end
  end
  #
  # def pass_disc(pass = {})
  #   pass[:to].unshift(pass[:from].pop)
  #
  #   if odd?(passing_array)
  #     pass_disc(from: passing_array, to: final_array, from: )
  # end

  def odd?(array)
    array.count.odd?
  end

  def even?(array)
    array.count.even?
  end
end
