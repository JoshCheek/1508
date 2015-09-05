require_relative 'line_numbers'

class Car
  def initialize(year)
    self.year = year
  end

  def birthday
    self.year += 1
  end

  def year
    @year
  end

  def year=(year)
    @year = year
  end
end


car = Car.new(1990)
car.birthday
p car
