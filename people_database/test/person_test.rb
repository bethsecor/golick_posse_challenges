require_relative '../person'
require 'minitest'

class PersonTest < Minitest::Test
  def test_person_responds_to_attributes
    valid_person = Person.new("Princess Consuela", "Banana Hammock", "pcbh@hotmail.com", "New York")

    assert_equal "Princess Consuela", valid_person.first_name
    assert_equal "Banana Hammock", valid_person.last_name
    assert_equal "pcbh@hotmail.com", valid_person.email
    assert_equal "New York", valid_person.state
  end

end
