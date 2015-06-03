class Say
  def initialize(number)
    # Things don't become uniform and totally systematic until
    # the number 20. 

    @ones_place = { 
                  00  => "",  1 => "one", 
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
    @tens_place = { 
                  2 => "twenty", 3 => "thirty",
                  4 => "fourty", 5 => "fifty",
                  6 => "sixty", 7 => "seventy",
                  8 => "eigthy", 9 => "ninety"
                  }

    @number = number
  end

  def in_english
    # Pseudo-code
    # 100,456
    # Make the number into an array of 3 digit Fixnums.
    # [100,456]
    # If array length is 2, append "thousands".
    # If array length is 3, append "millions". 
    # If array length is 4, append "billions".
    # Work from first element in array to end.
    # 100 - @ones_place = 1 + "hundred"
    # Then run algorithm for 0-99. 
    # 456 - @ones_place = 4 + "hundred"
    # Then run algorithm for 0-99. "fifty six"
    if @number == 0
      return "zero"
    end

    number_splitter 

    if @number < 19
      result = @ones_place[@number]
    elsif @number.to_s[-1] == "0"
      result = @tens_place[@number.to_s[-2].to_i]
    elsif @number.to_s[-1] != "0"
      result = "#{@tens_place[@number.to_s[-2].to_i]}-#{@ones_place[@number.to_s[-1].to_i]}"
    end
    result
  end

  def number_splitter
    number = @number.to_s.chars
    group  = 0
    result = ["B"]
    until group == 3
      result[0] << "A"
      group += 1
    end
    p result
    p number


  end
  
end
p Say.new(180).in_english