class Person
  attr_accessor :name
  def initialize
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}"
  end

end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new
chris.name = "Chris"
chris.greeting

christina = Student.new
christina.name = "Christina"
christina.greeting

chris = Instructor.new
chris.name = "Chris"
chris.teach

christina = Student.new
christina.name = "Christina"
christina.learn

christina = Student.new
christina.name = "Christina"
christina.teach

# You get a "NoMethodError" because Christina does not have the "teach ability" (Method) so it will not be called upon.
