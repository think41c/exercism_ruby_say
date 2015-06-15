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
    puts "The @split_num is #{@split_num}"
    if @number == 0
      return "zero"
    end

    if !@split_num[-2].nil? then number_feeder(@split_num[-2]) end
    if !@split_num[-1].nil? then number_feeder(@split_num[-1]) end

    
  end

  def number_feeder(num)
    result = ""  
    huns_group = ""
    # 100-999
    if num[-3].nil? 
      huns_group << ""
    else
      huns_group << num[-3]
    end

    # 10-99
    ones_group = ""
    if num[-2].nil?
      ones_group << ""
    else
      ones_group << num[-2]
    end

    # 0-9
    if num[-1].nil?
      ones_group << ""
    else
      ones_group << num[-1]
    end
    
    # Make the number ###############
    # Hundreds place
    if tens_n_ones(huns_group).nil?
      # nothing
    else
      result << "#{tens_n_ones(huns_group)} hundred"
    end

    # Tens place
    if result.length == 0
      result << "#{tens_n_ones(ones_group)}"
    elsif tens_n_ones(ones_group).nil?
      result << "#{tens_n_ones(ones_group)}"
    else 
      result << " #{tens_n_ones(ones_group)}"
    end
    result
  end

  def tens_n_ones(num_chunk)
    result = ""
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

p Say.new(456).in_english