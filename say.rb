class Say
  def initialize(number)
    # Things don't become uniform and totally systematic until
    # the number 20. 

    @ones_place  = { 0  => "zero",  1 => "one", 
                     2  => "two",   3 => "three",
                     4  => "four",  5 => "five",
                     6  => "six",   7 => "seven",
                     8  => "eight", 9 => "nine",
                     10 => "ten",  11 => "eleven",
                     12 => "twelve", 13 => "thirteen",
                     14 => "fourteen", 15 => "fifteen",
                     16 => "sixteen", 17 => "seventeen",
                     18 => "eighteen", 19 => "nineteen"
                   }
    @tens_place = {2 => "twenty-", 3 => "thirty-",
                   4 => "fourty-", 5 => "fifty-",
                   6 => "sixty-"
                  }
    @tens_place = "teen"
    @number = number
  end

  def in_english
    @ones_place [@number]
  end
end
