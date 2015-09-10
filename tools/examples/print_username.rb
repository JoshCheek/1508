class User
  def initialize(name)
    self.name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

user = User.new("Josh")
puts user.name
