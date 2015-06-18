class Say
  def initialize(number)
    @ones_place = { 
                  "1" => "one", 
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
                  "4" => "forty", "5" => "fifty",
                  "6" => "sixty",  "7" => "seventy",
                  "8" => "eighty", "9" => "ninety"
                  }
    @number = number
    @split_num = split(number)            
  end

  def in_english
    flag = true
    x = ""

    if @number < 0 || @number >= 1_000_000_000_000 
      raise ArgumentError, "Out of bounds"
    end
    
    if @number == 0
      return "zero"
    end

    if !@split_num[-4].nil? 
      x << number_feeder(@split_num[-4]) 
      if number_feeder(@split_num[-4]).length != 0 
        x << " billion " 
      end
    end
    
    if !@split_num[-3].nil? 
      x << number_feeder(@split_num[-3]) 
      if number_feeder(@split_num[-3]).length == 0 
        x = x[0..-2]
        flag = false
      else
        x << " million " 
      end
    end

    if !@split_num[-2].nil? 
      x << number_feeder(@split_num[-2]) 
      if number_feeder(@split_num[-2]).length == 0
        if flag == true
          x = x[0..-2]
        end
      else
        x << " thousand" 
      end
    end

    if !@split_num[-1].nil? 
      if x.length == 0 
        x << number_feeder(@split_num[-1]) 
      else
        if number_feeder(@split_num[-1]).length == 0 
          x 
        else
          x << " " + number_feeder(@split_num[-1]) 
        end
      end
    end
    x
  end

  def number_feeder(num)
    result     = ""  
    huns_group = ""
    ones_group = ""

    # 100-999
    if !num[-3].nil? 
      huns_group << num[-3]
    end
    # 10-99
    if !num[-2].nil?
      ones_group << num[-2]
    end
    # 0-9
    if !num[-1].nil?
      ones_group << num[-1]
    end
    
    # Make the number ###############
    # Hundreds place
    if !tens_n_ones(huns_group).nil?
      result << "#{tens_n_ones(huns_group)} hundred"
    end
    # Tens place
    if result.length == 0 || tens_n_ones(ones_group).nil?
      result << "#{tens_n_ones(ones_group)}"
    else 
      result << " #{tens_n_ones(ones_group)}"
    end
    result
  end

  def tens_n_ones(num_chunk)
    if num_chunk.to_i < 20
      @ones_place[num_chunk.to_i.to_s]
    else
      if num_chunk[-1] == "0"
        answer = "#{@tens_place[num_chunk[-2]]}"
      else
        answer = "#{@tens_place[num_chunk[-2]]}-#{@ones_place[num_chunk[-1]]}"
      end
    end
  end

  def split(num)
    num.to_s.chars.reverse.each_slice(3).map { |s| s.reverse.join }.reverse
  end
end
