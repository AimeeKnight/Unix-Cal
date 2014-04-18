require_relative 'month'
require_relative 'year.rb'

months = { 'January' => 31, 'February' => 28, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30, 'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31 }
spaces_before = [6, 0, 1, 2, 3, 5, 5]
spaces_after =  [0, 6, 5, 4, 3, 2, 1]

#puts "Enter a month, and year"
input_date = STDIN.gets.chomp
month = ARGV[0]
#day = ARGV[1]
year = ARGV[1]

total_days = months[month]
day = Month.new(month, 1, year)
month = day.month
start = day.calc
num_spaces_before = spaces_before[start]
num_spaces_after = spaces_after[start]

puts start
puts "#{num_spaces_before}"
puts "#{num_spaces_after}"
puts "#{total_days}"

puts
puts month
puts 'Su Mo Tu We Th Fr Sa'
num_spaces_before.times { print "   " }
print " 1 "
num = 2
num_spaces_after.times do
  print " #{num} " 
  num += 1
end

next_line = 7
(total_days - num + 1).times do
  puts if next_line % 7 == 0
  if num < 10
    print " #{num} " 
  else
    print "#{num} " 
  end
  num += 1
  next_line += 1
end
puts





