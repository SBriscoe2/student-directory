@students = []
def interactive_menu
  
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # because we'll be adding more items
    selection = gets.chomp
  
    case selection
    when "1"
      students = input_students
    when "2"
  	  print_header
      print_directory(@students)
      print_footer(@students)
    when "9"
  	  exit
    else
  	  puts "I don't know what you meant, try again"
    end
  end
end
#let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  
  nam = gets.chomp
  while !nam.empty? do
    @students << {name: nam, cohort: :november}
    puts "Now we have #{@students.count} students"
    nam = gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villians Academy"
  puts " -------------------------------"
end

def print_directory(students)
  @students.each_with_index do |student|
    nam = student[:name]
    cohort = student[:cohort]
    puts "#{nam} (#{cohort} cohort)"    	
    end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
interactive_menu
