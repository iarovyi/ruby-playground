require_relative "greeter-mixin"

module People

  def self.countPeople #static method
    puts "7 billions of people"
  end

  class Man
    #make properties public. It generates getters/setters for all properties in the list. Its a syntax sugar
    attr_reader :name, :lastName

    def age       #getter for property age
      @age
    end

    def age=(age) #setter for property age
      @age = age
    end

    include GreeterMixin         #include methods from mixin
    def initialize name, lastName, age
      @name = name         #instance properties accessed via @xxxx
      @lastName = lastName
      @age = age
      @createdAt = Time.new #by default curent time

      #symbol
      @country = :Netherlands
      #puts :mySymbol.object_id == :mySymbol.object_id
      #symbol is unique in scope of program
    end

    def self.printLocation
      puts "Lives on Earth"
    end
  end


  class Student < Man

    def initialize name, lastName, age, univercity, subjects, languages
      super name, lastName, age
      @univercity = univercity
      @subjects = subjects
      @languages = languages
    end

    def printStory
      hello @name
      puts "I'm student of type #{self.class}"
      printLanguages
      printSubjects
      printDescription
    end

    private def printLanguages
       print "I speak:"
=begin
      @languages.each do |language|
         print "#{language} "
      end
=end
=begin
      for language in @languages
        print "#{language} "
      end
=end

      #Pipelines and blocks (sort of lambda expression)
      @languages.each { |language|  print "#{language} " }
      puts
    end

    private def printSubjects
      @subjects.each do |subject|
         puts "Title - #{subject[:title]} Description - #{subject[:description]} "
      end
    end

    private def printDescription
      puts "I study at #{@univercity} and I live in #{@country}"
    end

  end
end
