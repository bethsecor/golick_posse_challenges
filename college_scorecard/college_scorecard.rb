require 'csv'

file = CSV.open "./2013_college_scorecards.csv", headers: true, header_converters: :symbol
value = ARGV[1]
opt_arg = ARGV[2].to_i if ARGV[2]

if ARGV.first == "by_state"
  results =
  file.select do |row|
    row[:stabbr] == value
  end.map{|row| row[:instnm]}

elsif ARGV.first == "top_average_faculty_salary"
  result_number = value.to_i
  results =
  file.select do |row|
    row[:avgfacsal] != "NULL"
  end .sort_by { |row| row[:avgfacsal].to_i }
      .map { |row| row[:instnm] }[-result_number..-1]
      .reverse

elsif ARGV.first == "median_debt_between"
  results =
  file.select do |row|
    salary = row[:grad_debt_mdn].to_i
    value = value.to_i
    (salary > value) && (salary < opt_arg)
  end.map{|row| "#{row[:instnm]} (#{row[:grad_debt_mdn]})"  }
end

puts results
