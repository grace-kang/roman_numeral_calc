class Calculator
  CONVERSION = {1 =>'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M' }

  def self.to_decimal(str)
    if !(str =~ /[IVXLCDivxlcd]+/)
      raise StandardError
    end

    invert = CONVERSION.invert
    str = str.upcase
    arr = str.split("")
    decimal = 0
    negative = false

    if arr[0] == '-'
      arr.delete_at(0)
      negative = true
    end

    arr.each_with_index do |item, index|
      if arr[index+1]
        if invert[item] < invert[arr[index+1]]
          decimal += invert[arr[index+1]] - invert[item]
          arr.delete_at(index+1)
        else
          decimal += invert[item]
        end
      else
        decimal += invert[item]
      end
    end
    if negative
      -(decimal)
    else
      decimal
    end
  end

  def self.to_roman(int)
    if !(int.is_a? Integer)
      raise StandardError
    end

    str = ""
    if int < 0
      str += "-"
      int = int.abs
    elsif int == 0
      return "0"
    end

    CONVERSION.reverse_each do |dec, rom|
      if int == 4 or int == 9
        str += "I#{CONVERSION[int+1]}"
        return str
      elsif int/10 == 4 or int/10 == 9
        str += "X#{CONVERSION[(int/10 * 10) + 10]}"
        int -= int/10 * 10
        if int == 0
          return str
        end
      elsif int/100 == 4 or int/100 == 9
        str += "C#{CONVERSION[(int/100 * 100) + 100]}"
        int -= int/100 * 100
        if int == 0
          return str
        end
      else
        str += rom * (int / dec)
        int -= dec * (int / dec) unless (int / dec) == 0
        if int == 0
          return str
        end
      end
    end
  end

  def self.add(str1, str2)
    to_roman(to_decimal(str1) + to_decimal(str2))
  end
  
  def self.sub(str1, str2)
    to_roman(to_decimal(str1) - to_decimal(str2))
  end

  def self.mult(str1, str2)
    to_roman(to_decimal(str1) * to_decimal(str2))
  end

  def self.div(str1, str2)
    to_roman(to_decimal(str1) / to_decimal(str2))
  end

  def self.mod(str1, str2)
    to_roman(to_decimal(str1) % to_decimal(str2))
  end
end

