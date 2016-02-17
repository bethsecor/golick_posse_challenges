require_relative 'person'

class People
  def initialize(people = [])
    @db = people
  end

  def add(people_attributes)
    person = Person.new(people_attributes[:first_name], people_attributes[:last_name], people_attributes[:email], people_attributes[:state])
    @db << person
  end

  def remove_person_by_email(email)
    person_to_delete = @db.detect do |person|
      person.email == email
    end
    @db.delete(person_to_delete)
  end
end
