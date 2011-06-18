# Yeah, I know I am going rogue agent here, but I don't like the idea 
# of having to include a mixin module just to do "acts_as_XXXX"

class Row
  def initialize(mappings)
    @mappings = mappings
    puts @mappings.inspect
  end

  def method_missing(name, *args)
    @mappings[name.to_s]
  end

  private
  attr_accessor :mappings
end

module ActsAsCsv
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def acts_as_csv
      attr_accessor :headers, :csv_contents
      include(InstanceMethods)
    end
  end

  module InstanceMethods
    # Minor changes below *before* suggested modifications in exercise
    def initialize
      @csv_contents = []
      root_dir = File.dirname(__FILE__)
      filename = File.join(root_dir, self.class.to_s.downcase + ".csv")
      file = File.new(filename, 'r')
      header = true

      file.each do |row|
        if header
          @headers = parse_headers(row)
          header = false
        else
          @csv_contents << parse_data(@headers, row)
        end
      end
    end

    def each
      @csv_contents.each do |row|
        yield row
      end
    end

    private
    def parse_headers(headers)
      parse_row(headers)
    end

    def parse_data(headers, data)
      row_hash = {}
      parse_row(data).each_with_index do |elem, idx|
        # downcase to conform to Ruby method naming conventions
        header_name = @headers[idx].downcase
        row_hash[header_name] = elem
      end
      Row.new(row_hash)
    end

    def parse_row(row)
      row.chomp.split(',')
    end
  end
end

# Any subclass of Parsable will be able to just type:
#   +acts_as_csv+
class Parsable
  include ActsAsCsv
  # We could then mixin ActsAsXml, ActsAsJson, etc. too
  # IMHO this reads better.
  # Alternatively instead of coding both:
  #   +include MixinModule+
  # and
  #   +acts_as_XXX+
  # it is ugly and error prone. Why not just:
  #   +inclue MixinModule+
  # and assume they want the behavior mixed in already?

  # Not a fan of the code style shown in the book myself!:)
end


class Playlist < Parsable
  acts_as_csv
end

pl = Playlist.new
puts pl.headers.inspect
puts pl.csv_contents.inspect

pl.each do |row|
  puts row.artist
end
