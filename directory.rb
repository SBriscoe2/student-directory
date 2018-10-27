@students = []
def interactive_menu
  loop do
    menu
    process(STDIN.gets.chomp)
  end
end

def menu  	
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" 
end

def process(selection) 
  case selection
    when "1"
      input_students
    when "2"
  	  show_students
  	when "3"
  	  save_students
  	when "4"
  	  load_students
    when "9"
  	  exit
    else
  	  puts "I don't know what you meant, try again"
  end
end

def save_students
# open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
  	student_data = [student[:name], student[:cohort]]
  	csv_line = student_data.join(",")
  	file.puts csv_line
  end
  file.close
end

def show_students
  print_header
  print_directory(@students)
  print_footer(@students)
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    nam, cohort = line.chomp.split(',')
    @students << {name: nam, cohort: cohort.to_sym}
  end  
  file.close	
end

#let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  
  nam = gets.chomp
  while !nam.empty? do
    @students << {name: nam, cohort: :november}
    puts "Now we have #{@students.count} students"
    nam = STDIN.gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villians Academy"
  puts " -------------------------------"
end

def print_directory(students)
  @students.each do |student|
    nam = student[:name]
    cohort = student[:cohort]
    puts "#{nam} (#{cohort} cohort)"    	
    end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given

  if File.exists?(filename) # if it exists
  	load_students(filename)
  	puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
  	puts "Sorry, #{filename} doesn't exist."
  	exit # quit the program
  end
end
#nothing happens until we call the methods
try_load_students
interactive_menu
