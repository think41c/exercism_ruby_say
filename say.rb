
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
    @split_num = split(number)            
  end

  def in_english
    puts @split_num
    puts "hi"
    if @number == 0
      return "zero"
    end
  end

  def split(num)
    num.to_s.chars.reverse.each_slice(3).map {|s| s.reverse.join.to_i }.reverse
  end
end
p Say.new(0).in_english

