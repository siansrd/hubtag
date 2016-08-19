require_relative('./letter')
require_relative('./pair')


class Tag

  attr_reader :tag_text, :tag, :height, :width

  MAX_HEIGHT =  7
  MAX_WIDTH  = 52
  
  def initialize(input)
    @tag_text = input
    @tag      = Tag.str_to_tag(input)  # tag is Array of Letter objects
    @height   = Tag.tag_height(@tag)
    @width    = Tag.tag_width(@tag)
  end


  def self.tag_height(tag)
    return Tag::MAX_HEIGHT
  end


  def self.tag_width(tag)
    width = 1              # leaves space for one column on the left
    tag.each { |letter|
      width += letter.width()
    }
    return width
  end


  def self.str_to_tag(input)
    tag = []
    input.split("").each { |char|
      tag.push(Letter.new(char))
    }
    return tag
  end


# Returns true if the length of the pixels 
# is longer than the maximum visible canvas. 
# Otherwise false.
  def too_long()
    return @width + @tag_text.length > Tag::MAX_WIDTH
  end


# Prints a 2D diagram of the tag in pixels.
  def print_pixels
    pixels = Array.new(Tag::MAX_HEIGHT) { Array.new(Tag::MAX_WIDTH, ' ')}
    current_column = 1

    @tag.each { |letter|
      letter.bitmap.each { |index2d|
        #if ((index2d.second < Tag MAX_HEIGHT) && 
        #    (index2d.first + current_column < Tag::MAX_WIDTH))
          pixels[index2d.second-1][index2d.first + current_column] = "\u2588"
        #end
      }
      current_column += letter.width + 1   # +1 to leave one space between letters
    }
    
    puts ""
    pixels.each { |row| puts(row.join) }
    puts ""
    
  end

# Prints a list of weeks and days 
# to contribute to Github to create the tag text.
  def print_list
      # take the first letter from the tag, letter.print_week
      puts "print list: TODO"
      @tag[0].print_weeks_and_days2()
  end

  def to_s()
    return @tag_text
  end

end
