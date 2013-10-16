class Bike

  def initialize
    fix
  end

	def broken?
	  @broken
	end

  def break!
    @broken = true
  end

  def fix
  	@broken = false
  end

  def to_break_bike 
    break!
  end

end