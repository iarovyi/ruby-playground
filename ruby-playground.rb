require_relative "man" #equals to: require(File.expand_path('path', File.dirname(__FILE__)))
require "rake"
require "colormath"

############################################### rake is analog of gulp for ruby
desc "Says hello."
task :hello, [ :name ] do |task, arguments|  # task is function from rake library
 name = arguments[:name]
 puts "Hello, #{name}."
end
###############################################
#Example of using third party gem library:
white  = ColorMath::hex_color("#fff")
puts Math.acos(0) == Math::PI/2 #Math is part of ruby installation
###############################################

if __FILE__ == $0
  puts "This file is the main file that was run by ruby"
end

begin
  People.countPeople
  People::Man.printLocation
  #Ruby Types: String, Fixnum(integer), Float, TrueClass, FalseClass, Array, NilClass(for nil), Symbol, Hash
  #array of hash objects
  subjects = [
    { :title => "Math", :description => "6 month course"  },
    { title: "Physics", description: "school course" } #different notation for symbol keys
  ]
  man = People::Student.new "Jack", "Daniels", 37, "Berkly", subjects, ["English", "Dutch"]
  man.printStory
  man.inspect
  class People::Student
    def dynamicallyAddedMethod
    end
  end
  puts People::Student.instance_methods(false) #will also contain dynamicallyAddedMethod

  2.times { | i | puts i }
  one, two = [1,2].map {|item|  "Item #{item.to_s}"}
  puts one
  puts two

  #raise ArgumentError, "Forcing the exception to be raised."
rescue ArgumentError => e
  puts "Missing arguments maybe?: #{e.class}"
rescue => e
  puts "Oops!"
end
