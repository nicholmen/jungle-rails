class Rohit

  def sayHello
    puts "i am a method that is an instance based method"
  end

  def self.DontSayHello
    puts "i am somethind different and i don't need an instance"
  end

end

t = Rohit.new 
t.sayHello


Rohit.DontSayHello
