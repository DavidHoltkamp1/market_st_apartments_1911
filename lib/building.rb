class Building
attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    total = @units.map do |unit|
      unit.monthly_rent
    end
    average =  (total.sum.to_f / @units.count).round(1)
  end
end
