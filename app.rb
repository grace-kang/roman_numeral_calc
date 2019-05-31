require_relative 'lib/calculator.rb'

puts "Roman numeral calculator:"
loop do
  input = $stdin.gets
  arr = input.split(" ")
  if arr[1] == '+'
    $stdout.write Calculator.add(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '-'
    $stdout.write Calculator.sub(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '*'
    $stdout.write Calculator.mult(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '/'
    $stdout.write Calculator.div(arr[0], arr[2])
    $stdout.write "\n"
  elsif arr[1] == '%'
    $stdout.write Calculator.mod(arr[0], arr[2])
    $stdout.write "\n"
  end
end

