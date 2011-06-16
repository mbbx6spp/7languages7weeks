#!/usr/bin/env rspec

require 'rubygems'
require 'rspec'
require 'stringio'
require File.join(File.dirname(__FILE__), "selfstudy")

RSpec.configure do |config|
  config.mock_with :rspec
end

# To capture stdout and/or stderr in our examples
def capture_streams(*streams)
  streams.map! { |stream| stream.to_s }
  begin
    result = StringIO.new
    streams.each { |stream| eval "$#{stream} = result" }
    yield
  ensure
    streams.each { |stream| eval("$#{stream} = #{stream.upcase}") }
  end
  result.string
end

shared_examples_for "Print contents of array in batches of four" do
  def digits
    (1..16).collect do |i|
      calc(i)
    end
  end

  def group(index)
    (1..4).collect do |i|
      calc(i + (index - 1)*4)
    end
  end

  def calc
    raise "Describe block using this shared behavior spec must implement calc method"
  end

  def do_it(digits)
    raise "Describe block using this shared behavior spec must implement do_it method"
  end

  it "should output expected lines" do
    expected_outputs = (1..4).collect do |i|
      list = group(i)
      expected_string = list.join(" ")
    end
    output = capture_streams(:stdout) { do_it }
    output.should =~ Regexp.new(expected_outputs.join("\n"))
  end
end

describe "Day Two, Week One: Self-Study Exercises" do
  describe "Print the contents of an array of sixteen numbers in groups of four at a time" do
    describe "using Array#each" do
      it_should_behave_like "Print contents of array in batches of four" do
        def calc(x)
          3*x + 1
        end

        def do_it
          DayTwo.print_groups_of_four_with_each(digits)
        end
      end
    end
    describe "using Enumerable#each_slice" do
      it_should_behave_like "Print contents of array in batches of four" do
        def calc(x)
          3*x + 1
        end

        def do_it
          DayTwo.print_groups_of_four_with_each_slice(digits)
        end
      end
    end
  end

  describe "Tree should accept a tree represented in a Hash" do
    before(:all) do
      @hash = {
        'grandpa' => {
          'dad' => { 'child 1' => {}, 'child 2' => {} },
          'uncle' => { 'child 3' => {}, 'child 4' => {} }
        }
      }
    end
    describe "on initiallize" do
      it "should raise an error if there is more than one element in the Hash - there can only be one root of a tree" do
        lambda {
          Tree.new('first' => {}, 'second' => {})
        }.should raise_error
      end
  
      it "should not raise ArgumentError when passing only one argument to initializer" do
        lambda {
          Tree.new(@hash)
        }.should_not raise_error
      end
    end

    describe "after initialized" do
      before(:each) do
        @tree = Tree.new(@hash)
      end

      it "should set node name of the root element as expected by given input" do
        @tree.node_name.should == 'grandpa'  
      end

      it "should have exactly two children" do
        @tree.should have_exactly(2).children
      end

      it "should have children of type Tree" do
        # doesn't actually test if there are children though thus previous example
        @tree.children.each {|child| child.should be_a(Tree) }
      end

      it "should have seven nodes in full tree" do
        counter = 0
        @tree.visit_all {|elem| counter += 1 }
        counter.should == 7
      end
    end
  end

  describe "My grepper" do
    before(:each) do
      @playlist = [
        "Ke$ha - Bla bla bla",
        "Lady Gaga - Just Dance",
        "Katy Perry - .....",
        "Lady Gaga - Alejandro"
      ]
      @filename = "myplaylist"
      File.stub!(:open).and_yield(@playlist[0]).
        and_yield(@playlist[1]).
        and_yield(@playlist[2]).
        and_yield(@playlist[3])
    end

    it "should print matching lines to STDOUT" do
      output = capture_streams(:stdout) do
        DayTwo.my_grepper(/Gaga/, @filename)
      end
      output.should =~ /2:#{@playlist[1]}/
      output.should =~ /4:#{@playlist[3]}/
    end

    it "should return expected result Hash" do
      # To remove horrid puts from RSpec success/failure output
      $stdout.stub!(:puts)
      result = DayTwo.my_grepper(/Gaga/, @filename)
      result.should have_exactly(1).entry
      (key, value) = result.first
      key.should == @filename
      value.should have_exactly(2).items
      # TODO: flesh out more if have time.
    end
  end
end
