#!/usr/bin/env rspec

require 'rubygems'
require 'rspec'

RSpec.configure do |config|
  config.mock_with :rspec
end

# Of course, these are kind of contrived since I am depending on 
# implementation details (a little). However, the self-study exercises
# are all a little contrived too!:)
describe "Day One, Week One: Self-Study Exercises" do
  describe "Print the string 'Hello, world.'" do
    before(:all) do
      @output = "Hello, world."
    end
    it "should pass 'Hello, world.' as an argument to puts on $stdout object" do
      $stdout.should_receive(:puts).with(@output)
      puts @output
    end
  end

  describe "Find index of 'Ruby' in string 'Hello, Ruby'" do
    before(:all) do
      @string = "Hello, Ruby"
    end

    it "should return 7 as index of 'Ruby'" do
      @string.index("Ruby").should === 7
    end
  end

  describe "Print name ten times" do
    before(:all) do
      @name = "Florence And The Machine" # a much better name than Susan Potter
    end

    it "should pass name to puts on $stdout object ten times" do
      $stdout.should_receive(:puts).with(@name).exactly(10).times
      10.times { puts @name }
    end
  end

  describe "Print string 'This is sentence number X' where X is integer starting at 1 incrementing by 1 to 10" do
    before(:all) do
      @base = "This is sentence number"
      @start = 1
      @end = 10
    end

    def do_it
      (1..10).each do |i|
        puts [@base, i].join(" ")
      end
    end

    it "should pass base string to puts on $stdout object ten times" do
      $stdout.should_receive(:puts).with(Regexp.new(@base)).exactly(10).times
      do_it
    end

    it "should increment counter each time by one starting at one ten times" do
      (1..10).each do |index|
        $stdout.should_receive(:puts).once.with(@base + " " + index.to_s).ordered
      end
      do_it
    end
  end

  describe "Run a Ruby program from a file" do
    before(:each) do
      @filename = File.join(File.dirname(__FILE__), "standalone.rb")
      @expected_output = "This is a standalone Ruby script sucka!"
    end

    def do_it
      system("ruby #{@filename}")
    end

    it "should print to $stdout expected output" do
      $stdout.should_receive(:puts).with(@expected_output)
    end

    it "should have a return status of 0" do
      ret_value = do_it
      ret_value.should be true
    end
  end
end
