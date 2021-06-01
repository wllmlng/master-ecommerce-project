# # p "Enter your name:"
# # name = gets
# # p "hello " + name


# puts "Enter 'yes' or 'no'"

# response = gets.chomp

# if response == "yes"
#   puts "yup!"
# elsif response == "no"
#   puts "nah!"
# else
#   puts "I'm sorry, my responses are limited."
# end

# class Bootcamp
#     def initialize(name, slogan, student_capacity)
#         @name = name
#         @slogan = slogan
#         @student_capacity = student_capacity
#         @students = []
#         @teachers = []
#         @grades = Hash.new {|h, k| h[k] = []} #every hash will have [] as defaul
#     end
  
#     def name
#         @name
#     end

#     def slogan
#         @slogan
#     end

#     def teachers
#         @teachers
#     end

#     def students
#         @students
#     end

#     def hire(str)
#         @teachers << str
#     end

#     def enroll(str)
#         if @students.length < @student_capacity
#             @students << str
#         else
#           false
#         end
#     end
# end

# bootcamp_1 = Bootcamp.new("Map Academy", "Anyone can be a cartographer.", 6)
# # p bootcamp_1.name
# # p bootcamp_1.slogan
# # p bootcamp_1.teachers
# # p bootcamp_1.students
# # p bootcamp_1.hire("Jeff")
# p bootcamp_1.enroll("student one")
# p bootcamp_1.enroll("student two")
# p bootcamp_1.students
# # p bootcamp_1.enroll("student three")
# # p bootcamp_1.enroll("student four")
# # p bootcamp_1.enroll("student five")
# # p bootcamp_1.enroll("student six")
# # p bootcamp_1.enroll("student seven")
# # p bootcamp_1.enroll("student eight")
# p bootcamp_1.students.length


# class Cat
#     def meow
#         "Im a cat"
#     end

    
# end



class Person
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other_person)
    @last_name == other_person.last_name
  end
end

person_1 = Person.new("Jane", "Doe", 20)
person_2 = Person.new("John", "Doe", 18)
person_3 = Person.new("John", "Wayne", 18)

# Calling Person#== without any syntactic sugar is awkward:
p person_1.==(person_2)     # true

# With syntactic sugar, it's much more elegant:
p person_1 == person_2      # true
p person_2 == person_3      # false