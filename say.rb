class Say
  def initialize(number)
    @spelled_out = { 0 => "zero", 1 => "one", 
                    2 => "two", 3 => "three"
                   }
    @number = number
  end

  def in_english
    @spelled_out[@number]
  end
end
