puts "Input exam grade one:"
exam_one = gets.chomp().to_i
puts "Input exam grade two:"
exam_two = gets.chomp().to_i
puts "Input exam grade three:"
exam_three = gets.chomp().to_i

def list_grade(exam_one, exam_two, exam_three)
  puts "Exams: #{exam_one}, #{exam_two}, #{exam_three}"
end

def average_grade(exam_one, exam_two, exam_three)
  average = (exam_one + exam_two + exam_three) / 3
end

average = average_grade(exam_one, exam_two, exam_three).to_i

def letter_grade(average_grade)
  if average_grade < 59
    puts "Grade: F"
  elsif average_grade >= 60 && average_grade <= 69
    puts "Grade: D"
  elsif average_grade > 70 & average_grade <= 79
    puts "Grade: C"
  elsif average_grade >= 80 && average_grade <= 89
    puts "Grade: B"
  elsif average_grade >= 90
    puts "Grade: A"
  end
end

def pass_fail(average)
  if average < 59
    puts "Student is failing."
  else
    puts "Student is passing."
  end
end

list_grade(exam_one, exam_two, exam_three)
puts "Average: #{average}"
letter_grade(average)
pass_fail(average)

# class Person
#   attr_reader :first_name

#   def initialize(input_first_name, input_last_name)
#     @first_name = input_first_name
#     @last_name = input_last_name
#   end

#   def last_first_name
#     "{@last_name}  {@first_name}"
#   end
# end

# tj = Person.new("Thomas", "Jefferson")
# puts tj.first_name
# puts tj

# puts "Greetings! What is your year of origin?"
# origin = gets.chomp.to_i
# if (origin < 1900)
#   puts 'That\'s the past!'
# elsif (origin > 1900 && origin < 2020)
#   puts "That's the present!"
# elsif puts "That's the future!"
# end

# puts "Hello!"
# greeting = gets.chomp()
# if greeting == "Arrr!"
#   puts "Go away, pirate."
# elsif puts "Greetings, hater of pirates!"
# end
# dickens = ["Charles Dickens,", "1870"]
# thackeray = ["William Thackeray", "1863"]
# trollope = ["Anthony Trollope", "1882"]
# hopkins = ["Gerard Manley Hopkins", "1889"]

# def died(array)
#   name = array[0]
#   year = array[1]
#   return "#{name} died in #{year}."
# end

# puts died(dickens)
# puts died(thackeray)
# puts died(trollope)
# puts died(hopkins)
