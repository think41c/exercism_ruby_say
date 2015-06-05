class Say
  def initialize(number)
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
    result = 0 
    p split = number_splitter 
    p degree = split.length
    number_under_hundred
    # number_splitter
    result = ""
    if split[-1].to_s.length == 3
      hundred = @number.to_s[-3].to_i
      result = "#{@ones_place[hundred]} hundred"
    end

    puts "result #{result}, <100 #{number_under_hundred}"

    # if result >> length && number_under_hundred.length >> 1
    #   puts number_under_hundred.length
    #   space = " "
    # end

    result +  number_under_hundred

  end

  def number_under_hundred
    if @number.to_s[-1] == "0" && @number.to_s[-2] == "0"
      result = ""
    elsif @number < 19
      result = @ones_place[@number]
    elsif @number.to_s[-1] == "0"
      result = @tens_place[@number.to_s[-2].to_i]
    elsif @number.to_s[-1] != "0"
      result = "#{@tens_place[@number.to_s[-2].to_i]}-#{@ones_place[@number.to_s[-1].to_i]}"
    end
    
    result

  end

  def number_splitter
    @number.to_s.chars.reverse.each_slice(3).map {|s| s.reverse.join.to_i }.reverse
  end
  
end
p Say.new(100).in_english