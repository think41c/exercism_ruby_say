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

    if @number == 0
      return "zero"
    end

    if @split_num.length == 1
      p @split_num[-1]
      x = tens_n_ones(@split_num[-1], -1)
    end

    if @split_num.length == 2 
      if @ones_place[@split_num[-2][-1]].nil?
        puts @ones_place[@split_num]
        puts @split_num
      else
        result << @ones_place[@split_num[-2][-3]]
        result << " hundred "
      end
      x = tens_n_ones(@split_num[-3], -2)
      x << " thousand " + tens_n_ones(@split_num[-2], -1)
    end
    x
  end

  def tens_n_ones(the_split_num, deg)
    result = ""
    # Deal with the hundreds digit
    if @split_num[deg].nil?
      puts "itsnil"
    else
      if @split_num[deg].length == 3 
        if @ones_place[@split_num[deg][-3]].nil?
          puts "this is if it's x000"
        else
          result << @ones_place[@split_num[deg][-3]]
          result << " hundred "
        end
      end
    end
# Deal with the tens and ones digit

    if @split_num[deg].to_i < 20
      @ones_place[@split_num[deg]]
    else
      if @split_num[deg][-1] == "0" 
        puts "ZZ"
        if @tens_place[@split_num[deg][-2]].nil?
          puts "YY"
          # 100 comes through here
          result = "#{@ones_place[@split_num[deg][-3]]} hundred"
        else
          puts "BB"
          result << @tens_place[@split_num[deg][-2]]
        end 
      end
    if @split_num[deg][-1] != "0"
      puts "PP"
      if !@tens_place[@split_num[deg][-2]].nil?
        result << @tens_place[@split_num[deg][-2]]
      end
      if @split_num[deg].length != 3
        # 21-99 come through here
        # p @ones_place[@split_num[deg][-2]]
        result << "-#{@ones_place[@split_num[deg][-1]]}"
      else 
        # 101+ come through here
        result << "#{@ones_place[@split_num[deg][-1]]}"
      end
    end
    result
    end
  
  end

  def split(num)
    num.to_s.chars.reverse.each_slice(3).map { |s| s.reverse.join }.reverse
  end
end

p Say.new(22).in_english