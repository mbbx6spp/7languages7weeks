#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children)
    @children = children
    @node_name = name
  end
  
  def to_s
    "#{self.node_name}#{children_string}"
  end
  
  def children_string
    children_names = children.collect {|child| child.to_s}
    " ( #{children_names.join(', ')} )" unless children.empty?
  end
  
  

end

ruby_tree = Tree.new( "Smalltalk", [
    Tree.new( "Ruby", [
      Tree.new("Reia", []), 
      Tree.new("MacRuby", [])
    ] ) 
  ] )

puts "To string: #{ruby_tree.to_s}"
