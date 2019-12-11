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

  def renter_with_highest_rent
    rented_units = @units.find_all do |unit|
      unit.renter != nil
    end
    highest_rent = rented_units.max_by do |unit|
      unit.monthly_rent
    end
    highest_rent.renter
  end

  def annual_breakdown
    annual = {}
    @units.map do |unit|
      if unit.renter != nil
      annual[unit.renter.name] = (unit.monthly_rent) * 12
      end
    end
    annual
  end
end
