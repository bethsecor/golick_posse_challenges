require_relative 'person'
require 'pry'

class PeopleDatabase
  attr_reader :db

  def initialize(people = [])
    @db = people
  end

  def add(people_attributes)
    person = Person.new(people_attributes[:first_name], people_attributes[:last_name], people_attributes[:email], people_attributes[:state])
    @db << person
  end

  def remove_person_by_email(email)
    remove_by_attribute(:email, email)
  end

  def remove_by_state(state)
    remove_by_attribute(:state, state)
  end

  def remove_by_attribute(attribute, value)
    people_to_delete = @db.select{ |person| person.send(attribute) == value}
    people_to_delete.each {|person| @db.delete(person)}
  end

  def email_addresses
    emails = @db.map{|person| person.email}
    emails.join(", ")
  end

  def state_count(state)
    from_state = @db.select{|person| person.state == state}
    from_state.count
  end
end

if __FILE__ == $0
  pdb = PeopleDatabase.new
  pdb.add(first_name: "Tess", last_name: "Griffin", email: "tess@turing.io", state: "GA")
  pdb.add(first_name: "Sal", last_name: "Espinosa", email: "sal@sal.com", state: "CO")
  pdb.add(first_name: "Heidi", last_name: "Hoopes", email: "heidi@heidi.com", state: "CO")
  pdb.add(first_name: "July", last_name: "Tran", email: "july@july.com", state: "CO")
  pdb.add(first_name: "Beth", last_name: "Secor", email: "beth@beth.com", state: "TX")
  puts pdb.email_addresses
  pdb.remove_person_by_email("sal@sal.com")
  puts pdb.email_addresses
  puts pdb.state_count("CO")
  puts pdb.state_count("GA")
  puts pdb.state_count("TX")
  pdb.remove_by_state("CO")
  puts pdb.email_addresses
  puts pdb.state_count("CO")

end
