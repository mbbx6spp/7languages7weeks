#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Numeric
  def inches
    self
  end
  
  def feet
    self * 12.inches
  end
  
  def yards
    self * 3.feet
  end
  
  def miles
    self * 5280.feet
  end
  
  def back
    self * -1
  end
  
  def forward
    self
  end
end

puts 10.miles.back
puts 2.feet.forward