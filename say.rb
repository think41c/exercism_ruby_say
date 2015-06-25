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
    x            = 0
    result       = ""
    xxx          = ""
    final_result = ""
    degrees = {0 => "thousand"}
    until @split_num[x] == nil
      p "#{@split_num[x]} <- The split_num chunk we're on"
      p "#{degrees[x]} <- Degree of digit, if applicable"
      p "#{x} <- Current counter"  
      p "#{@split_num.length} <- length of split_num chunks"

      if !@split_num[x][-3] == nil? 
        huns = @split_num[x][-3]
      else
        huns = "" 
      end

      if !@split_num[x][-2] == nil? 
        tens = @split_num[x][-2]
      else
        tens = "0" 
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

      p "huns -> #{huns}, tens -> #{tens}, ones -> #{ones}"
      p final_result << huns + tens_n_ones(tens + ones)
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

a = Say.new(1550).in_english
p a