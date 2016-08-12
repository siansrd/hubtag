require_relative('./letter')
require_relative('./tag')

input = "HubTag!"

tag = Tag.new(input)


  if !tag.too_long
     tag.print_pixels()  
     tag.print_list()
  else
    puts "Error. Tag is too long."
  end



