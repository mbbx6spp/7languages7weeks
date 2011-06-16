
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

    def my_grepper(regex, *filenames)
      results = {}
      counter = 0
      filenames.each do |fn|
        line_matches = {}
        counter += 1
        current_line_no = 0
        File.open(fn, 'r') do |line|
          current_line_no += 1
          if line =~ regex
            line_matches[current_line_no] = line
            puts "#{current_line_no}:#{line}"
          end
        end
        results[fn] = line_matches
      end
      # Return something useful to the client code so that 
      # they can do something useful with the results
      results
    end
  end
end

class Tree
  attr_accessor :children, :node_name

  def initialize(hash)
    raise "There can only be one root for a tree" unless hash.size === 1
    (name, kids) = root = hash.first
    @node_name = name
    @children = []
    kids.each do |kid|
      @children << construct_child(kid)
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each {|c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call(self)
  end

  private

  def construct_child(elem)
    (name, kids) = elem
    Tree.new(name => kids)
  end
end
