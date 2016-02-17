class Person
  attr_reader :email, :state

  def initialize(first_name, last_name, email, state)
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @state      = state
  end
end
