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
    
    if @number < 0 || @number >= 1_000_000_000_000 
      raise ArgumentError, "Out of bounds"
    end
    @split_num = split(number)            
  end

  def in_english
    three_digit
  end

  def three_digit
    x            = 0
    result       = ""
    final_result = ""
    degrees      = {2 => "thousand ", 3=> " million", 4=> " billion"}
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

        puts @split_num.length 
        if !degrees[x+1].nil?
          stick = degrees[x+1]
        else
          stick = ""
        end

        # split_num.length is always +1 of x and < 5.
        # If x is zero, and split_num.length is equal to 
        # 1 - Then nothing.
        # 2 - Then thousand.
        # 3 - Then million.
        # 4 - Then billion.
        # If x is 1, and split_num.length is equal to 
        # 2 - Then thousand.
        # 3 - Then million.
        # 4 - Then billion.
        # If x is 2, and split_num.length is equal to 
        # 3 - Then million.
        # 4 - Then billion.
        # If x is 3, and split_num.length is equal to 
        # 4 - Then billion.
      end

      final_result << stick
      p final_result
      p final_result
      p final_result
      p final_result
      #Is it 3 0's? 
      if huns == "0" && tens == "0" && ones == "0"
        num_chunk_to_send = "" 
        p 'here'
      else
        num_chunk_to_send = tens_n_ones(tens + ones) 
      end
      p huns
      # Why is huns 0 when the number to translate is 1000.
      final_result << huns + num_chunk_to_send

      if !@split_num[x+1].nil?
        final_result << " "
      end
      x += 1
    end
    final_result 
  end

  def tens_n_ones(num_chunk)
    p "The num_chunk is #{num_chunk}"
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
end

a = Say.new(1000).in_english
p a