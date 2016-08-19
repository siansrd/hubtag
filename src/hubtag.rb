require_relative('./letter')
require_relative('./tag')

puts "What's your tag?"
input = gets.chomp.upcase

tag = Tag.new(input)

  if !tag.too_long
     tag.print_pixels()  
     tag.print_list()
  else
    puts "Error: the tag you provided is too long."
  end



