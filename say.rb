
class Say
  def initialize(number)
    @ones_place = { 
                  "00" => "",          "1" => "one", 
                  "2"  => "two",       "3" => "three",
                  "4"  => "four",      "5" => "five",
                  "6"  => "six",       "7" => "seven",
                  "8"  => "eight",     "9" => "nine",
                  "10" => "ten",      "11" => "eleven",
                  "12" => "twelve",   "13" => "thirteen",
                  "14" => "fourteen", "15" => "fifteen",
                  "16" => "sixteen",  "17" => "seventeen",
                  "18" => "eighteen", "19" => "nineteen"
                  }
    @tens_place = { 
                  "2" => "twenty", "3" => "thirty",
                  "4" => "fourty", "5" => "fifty",
                  "6" => "sixty",  "7" => "seventy",
                  "8" => "eigthy", "9" => "ninety"
                  }
    @number = number
    @split_num = split(number)            
  end

  def in_english
    result = ""
    degrees = @split_num.length
    x = -1

    if @number == 0
      return "zero"
    end
    
    
    if @split_num[x].length == 3 
      result << @ones_place[@split_num[-1][-3]]
      result << " hundred "
    end
    
    if @split_num[-1].to_i < 20
      @ones_place[@split_num[x]]
    else
      if @split_num[x][-1] == "0" 
        if @tens_place[@split_num[-1][-2]].nil?
          result = "#{@ones_place[@split_num[-1][-3]]} hundred"
        else
          result << @tens_place[@split_num[-1][-2]]
        end 
      end

      if @split_num[x][-1] != "0"
        result << @tens_place[@split_num[-1][-2]]
        result << "-#{@ones_place[@split_num[-1][-1]]}"
      end

    result
    end
  end

  def split(num)
    num.to_s.chars.reverse.each_slice(3).map { |s| s.reverse.join }.reverse
  end
end
p Say.new(120).in_english
