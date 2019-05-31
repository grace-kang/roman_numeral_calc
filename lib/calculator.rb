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
      if item == 'I' && arr[index+1] && arr[index+1] != 'I'
        decimal += invert[arr[index+1]] - 1
        arr.delete_at(index+1)
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
      if CONVERSION.keys.include? int+1
        str += "I#{CONVERSION[int+1]}"
        return str
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

