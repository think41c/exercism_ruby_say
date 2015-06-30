class Say
  def initialize(number)
    @ones_place = {""  => "",         "00" => "", 
                  "0"  => "zero",      "1" => "one", 
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
                  "4" => "forty",  "5" => "fifty",
                  "6" => "sixty",  "7" => "seventy",
                  "8" => "eighty", "9" => "ninety"
                  }
    @number = number
    bounds_test(number)
  end

  def bounds_test(num_to_test)
    if num_to_test < 0 || num_to_test >= 1_000_000_000_000 
      raise ArgumentError, "Out of bounds"
    end
    @split_num = split(num_to_test)            
  end


  def in_english
    x            = 0
    result       = ""
    final_result = ""
    degrees      = {1 => "", 2=> "thousand ", 3=> " million"}
    flag         = true

    until @split_num[x] == nil
      if !@split_num[x][-3] == nil? 
        huns = @split_num[x][-3]
      else
        huns = "" 
      end

      if !@split_num[x][-2] == nil? 
        tens = @split_num[x][-2]
      else
        tens = "" 
      end

      if !@split_num[x][-1] == nil? 
        ones = @split_num[x][-1]
      else
        ones = "" 
      end

      if tens_n_ones(huns).length > 2 && tens_n_ones(huns) != "zero" 
        huns = tens_n_ones(huns) + " hundred"        
        if tens_n_ones(tens + ones).length > 1
          huns << " "
        end
      end

      if x == x && @split_num.length > x  
        if !degrees[x+1].nil?
          if huns == "0" && tens == "0" && ones == "0"
            stick = degrees[x]
          else
            degree_of_num = @split_num.length
            stick         = degrees[degree_of_num]
            degree_of_num += 1
          end
        else
          stick = ""
        end
      end

      if huns == "0" && tens == "0" && ones == "0"
        num_chunk_to_send = "" 
      else
        final_result << stick + huns + tens_n_ones(tens + ones) 
      end

      space_for_next_degree(x)

      p "#{final_result} <- Final result"
      x += 1
    end
    final_result 
  end

  def tens_n_ones(num_chunk)
    if num_chunk == "000" || num_chunk == "00"
      answer = ""
    elsif num_chunk.to_i < 20
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

  def space_for_next_degree(x)
    if !@split_num[x+1].nil?
      final_result << " "
    end
  end
      
end

a = Say.new(119).in_english
p a