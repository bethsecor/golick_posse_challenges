require_relative '../people_database'
require 'minitest'
require 'pry'

class PeopleDatabaseTest < Minitest::Test
  def test_added_person_to_database_is_accessible
    database = PeopleDatabase.new
    database.add(valid_person)
    valid_person.each do |k, v|
      assert_equal v, database.db.last.send(k)
    end
  end

  def test_remove_by_state_results_in_person_not_in_database
    database = PeopleDatabase.new
    database.add(valid_person)
    database.add(comparison_person)

    assert_equal 2, database.db.count
    included = database.db.detect {|person| person.state == "New York"}
    assert_equal "New York", included.state

    database.remove_by_state("New York")
    assert_equal 1, database.db.count
    assert_nil database.db.detect {|person| person.state == "New York"}
  end

  def test_email_addresses_lists_all_emails
    database = PeopleDatabase.new
    database.add(valid_person)
    database.add(comparison_person)

    assert_equal "pcbh@hotmail.com, spilgrim@hotmail.com", database.email_addresses
  end

  def test_state_count_returns_amount_people_from_given_state
    database = PeopleDatabase.new
    database.add(valid_person)
    database.add(comparison_person)

    assert_equal 1, database.state_count("New York")
    assert_equal 1, database.state_count("Toronto")
    assert_equal 0, database.state_count("Colorado")

  end


  def valid_person
    {
      first_name: "Princess Consuela",
      last_name:  "Banana Hammock",
      email:      "pcbh@hotmail.com",
      state:      "New York"
    }
  end

  def comparison_person
      {
      first_name: "Scott",
      last_name:  "Pilgrim",
      email:      "spilgrim@hotmail.com",
      state:      "Toronto"
    }
  end
end
