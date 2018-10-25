#let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  students = []

  nam = gets.chomp
  while !nam.empty? do
    students << {name: nam, cohort: :november}
    puts "Now we have #{students.count} students"
    nam = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villians Academy"
  puts " -------------------------------"
end

def print_directory(students)
  students.each do |student|
    nam = student[:name]
    cohort = student[:cohort]
    puts "#{nam} (#{cohort} cohort)"    	
    end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print_directory(students)
print_footer(students)