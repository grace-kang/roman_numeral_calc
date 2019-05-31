calc = Calculator.new
puts "Roman numeral calculator:"
loop do
  input = $stdin.gets
  arr = input.split(" ")
  if arr[1] == '+'
    $stdout.write calc.add(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '-'
    $stdout.write calc.sub(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '*'
    $stdout.write calc.mult(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '/'
    $stdout.write calc.div(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '%'
    $stdout.write calc.mod(arr[0], arr[2])
    $stdout.write "\n"
  end
end

