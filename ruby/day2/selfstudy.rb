
module DayTwo
  class << self
    # This is pretty awful, but really the only way to do it with just each, I think!?
    def print_groups_of_four_with_each(digits)
      counter = 0
      digits.each do |elem|
        counter += 1
        print elem
        ((counter % 4) == 0) ? puts : print(' ')
      end
    end
  
    def print_groups_of_four_with_each_slice(digits)
      digits.each_slice(4) do |slice|
        puts slice.join(' ')
      end
    end
  end
end
