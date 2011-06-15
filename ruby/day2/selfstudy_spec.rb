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
end
