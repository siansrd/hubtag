require_relative('./pair')
require('pry-byebug')

class Letter

  attr_reader :char, :bitmap, :height,:width

  # letter pixel representation: pixel at (column,row) is set
  LETTERS = {
  
    ' ' => [], # empty space of width one
    
    'A' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5), 
            Pair.new(1,6), Pair.new(1,7), Pair.new(2,1), Pair.new(2,4), 
            Pair.new(3,1), Pair.new(3,4), Pair.new(4,2), Pair.new(4,3),
            Pair.new(4,4), Pair.new(4,5), Pair.new(4,6), Pair.new(4,7)],
            
    'B' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,4), Pair.new(2,7), Pair.new(3,1), Pair.new(3,4),
            Pair.new(3,7), Pair.new(4,2), Pair.new(4,3), Pair.new(4,5), 
            Pair.new(4,6)],
    
    'C' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,7), Pair.new(4,2), Pair.new(4,6)],

    'D' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,7), Pair.new(3,1), Pair.new(3,7), Pair.new(4,2),
            Pair.new(4,3), Pair.new(4,4), Pair.new(4,5), Pair.new(4,6)],
    
    'E' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,4), Pair.new(2,7), Pair.new(3,1), Pair.new(3,4),
            Pair.new(3,7)],

    'F' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,4), Pair.new(3,1)],
    
    'G' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,4), Pair.new(3,7), Pair.new(4,2), Pair.new(4,4),
            Pair.new(4,5), Pair.new(4,6)],
 
    'H' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,4),
            Pair.new(3,4), Pair.new(4,1), Pair.new(4,2), Pair.new(4,3),
            Pair.new(4,4), Pair.new(4,5), Pair.new(4,6), Pair.new(4,7)],

    'I' => [Pair.new(1,1), Pair.new(1,7), Pair.new(2,1), Pair.new(2,2),
            Pair.new(2,3), Pair.new(2,4), Pair.new(2,5), Pair.new(2,6),
            Pair.new(2,7), Pair.new(3,1), Pair.new(3,7)],
 
    'J' => [Pair.new(1,1), Pair.new(1,6), Pair.new(2,1), Pair.new(2,7),
            Pair.new(3,1), Pair.new(3,2), Pair.new(3,3), Pair.new(3,4),
            Pair.new(3,5), Pair.new(3,6)],
 
    'K' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,4),
            Pair.new(3,3), Pair.new(3,5), Pair.new(4,2), Pair.new(4,6),
            Pair.new(5,1), Pair.new(5,7)],
  
    'L' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,7),
            Pair.new(3,7)],
 
    'M' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,2),
            Pair.new(3,3), Pair.new(3,4), Pair.new(4,2), Pair.new(5,1),
            Pair.new(5,2), Pair.new(5,3), Pair.new(5,4), Pair.new(5,5),
            Pair.new(5,6), Pair.new(5,7)],

    'N' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,2),
            Pair.new(3,3), Pair.new(4,4), Pair.new(5,1), Pair.new(5,2),
            Pair.new(5,3), Pair.new(5,4), Pair.new(5,5), Pair.new(5,6),
            Pair.new(5,7)],

    'O' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,7), Pair.new(4,2), Pair.new(4,3), Pair.new(4,4),
            Pair.new(4,5), Pair.new(4,6)],

    'P' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,4), Pair.new(3,1), Pair.new(3,4), Pair.new(4,2),
            Pair.new(4,3)],
    
    'Q' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,5), Pair.new(3,7), Pair.new(4,2), Pair.new(4,3),
            Pair.new(4,4), Pair.new(4,5), Pair.new(4,6), Pair.new(5,7)],

    'R' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,4), Pair.new(3,1), Pair.new(3,4), Pair.new(4,2),
            Pair.new(4,3), Pair.new(4,5), Pair.new(4,6), Pair.new(4,7)],

    'S' => [Pair.new(1,2), Pair.new(1,6), Pair.new(2,1), Pair.new(2,3),
            Pair.new(2,7), Pair.new(3,1), Pair.new(3,4), Pair.new(3,7),
            Pair.new(4,2), Pair.new(4,5), Pair.new(4,6)],
 
    'T' => [Pair.new(1,1), Pair.new(2,1), Pair.new(2,2), Pair.new(2,3),
            Pair.new(2,4), Pair.new(2,5), Pair.new(2,6), Pair.new(2,7),
            Pair.new(3,1)],

    'U' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(2,7), Pair.new(3,7),
            Pair.new(4,1), Pair.new(4,2), Pair.new(4,3), Pair.new(4,4),
            Pair.new(4,5), Pair.new(4,6)],
 
    'V' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(2,6), Pair.new(3,7), Pair.new(4,6),
            Pair.new(5,1), Pair.new(5,2), Pair.new(5,3), Pair.new(5,4),
            Pair.new(5,5)],
    
    'W' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,6), Pair.new(1,7), Pair.new(2,6),
            Pair.new(3,5), Pair.new(4,6), Pair.new(5,1), Pair.new(5,2),
            Pair.new(5,3), Pair.new(5,4), Pair.new(5,5), Pair.new(5,6),
            Pair.new(5,7)],

    'X' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,6), Pair.new(1,7),
            Pair.new(2,3), Pair.new(2,5), Pair.new(3,4), Pair.new(4,3),
            Pair.new(4,5), Pair.new(5,1), Pair.new(5,2), Pair.new(5,6),
            Pair.new(5,7)],
   
    'Y' => [Pair.new(1,1), Pair.new(2,2), Pair.new(3,3), Pair.new(3,4),
            Pair.new(3,5), Pair.new(3,6), Pair.new(3,7), Pair.new(4,2),
            Pair.new(5,1)],
              
    'Z' => [Pair.new(1,1), Pair.new(1,5), Pair.new(1,6), Pair.new(1,7),
            Pair.new(2,1), Pair.new(2,4), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,3), Pair.new(3,7), Pair.new(4,1), Pair.new(4,2),
            Pair.new(4,3), Pair.new(4,4), Pair.new(4,5), Pair.new(4,6),
            Pair.new(4,7), Pair.new(5,1), Pair.new(5,2), Pair.new(5,7)],
 
    '1' => [Pair.new(1,2), Pair.new(1,7), Pair.new(2,1), Pair.new(2,2),
            Pair.new(2,3), Pair.new(2,4), Pair.new(2,5), Pair.new(2,6),
            Pair.new(2,7), Pair.new(3,7)],

    '2' => [Pair.new(1,2), Pair.new(1,6), Pair.new(1,7), Pair.new(2,1),
            Pair.new(2,5), Pair.new(2,7), Pair.new(3,1), Pair.new(3,4),
            Pair.new(3,7), Pair.new(4,2), Pair.new(4,3), Pair.new(4,7)],

    '3' => [Pair.new(1,2), Pair.new(1,6), Pair.new(2,1), Pair.new(2,4),
            Pair.new(2,7), Pair.new(3,1), Pair.new(3,4), Pair.new(3,7),
            Pair.new(4,2), Pair.new(4,3), Pair.new(4,5), Pair.new(4,6)],
     
    '4' => [Pair.new(1,4), Pair.new(1,5), Pair.new(2,3), Pair.new(2,5),
            Pair.new(3,2), Pair.new(3,5), Pair.new(4,1), Pair.new(4,2),
            Pair.new(4,3), Pair.new(4,4), Pair.new(4,5), Pair.new(4,6),
            Pair.new(4,7), Pair.new(5,5)],
    
    '5' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,6),
            Pair.new(2,1), Pair.new(2,3), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,3), Pair.new(3,7), Pair.new(4,1), Pair.new(4,4),
            Pair.new(4,5), Pair.new(4,6)],
    
    '6' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,4), Pair.new(2,7),
            Pair.new(3,1), Pair.new(3,4), Pair.new(3,7), Pair.new(4,2),
            Pair.new(4,5), Pair.new(4,6)],
    
    '7' => [Pair.new(1,1), Pair.new(1,5), Pair.new(1,6), Pair.new(1,7),
            Pair.new(2,1), Pair.new(2,4), Pair.new(3,1), Pair.new(3,3),
            Pair.new(4,1), Pair.new(4,2)],

    '8' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,5), Pair.new(1,6),
            Pair.new(2,1), Pair.new(2,4), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,4), Pair.new(3,7), Pair.new(4,2), Pair.new(4,3),
            Pair.new(4,5), Pair.new(4,6)],

    '9' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,6),
            Pair.new(2,1), Pair.new(2,4), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,4), Pair.new(3,7), Pair.new(4,2), Pair.new(4,3),
            Pair.new(4,4), Pair.new(4,5), Pair.new(4,6)],

    '0' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,7), Pair.new(4,2), Pair.new(4,3), Pair.new(4,4),
            Pair.new(4,5), Pair.new(4,6)],
    
    '!' => [Pair.new(1,1), Pair.new(1,2), Pair.new(1,3), Pair.new(1,4),
            Pair.new(1,5), Pair.new(1,7)],
        
    '\'' => [Pair.new(1,1), Pair.new(1,2)],

    '(' => [Pair.new(1,3), Pair.new(1,4), Pair.new(1,5), Pair.new(2,2),
            Pair.new(2,6), Pair.new(3,1), Pair.new(3,7)],
 
    ')' => [Pair.new(1,1), Pair.new(1,7), Pair.new(2,2), Pair.new(2,6),
            Pair.new(3,3), Pair.new(3,4), Pair.new(3,5)],
  
    '+' => [Pair.new(1,4), Pair.new(2,3), Pair.new(2,4), Pair.new(2,5),
            Pair.new(3,4)],

    ',' => [Pair.new(1,7), Pair.new(2,6)],

    '.' => [Pair.new(1,7)],

    '/' => [Pair.new(1,7), Pair.new(2,4), Pair.new(2,5), Pair.new(2,6),
            Pair.new(3,2), Pair.new(3,3), Pair.new(4,1)],

    ':' => [Pair.new(1,3), Pair.new(1,5)],

    '=' => [Pair.new(1,3), Pair.new(1,5), Pair.new(2,3), Pair.new(2,5),
            Pair.new(3,3), Pair.new(3,5)],

    '@' => [Pair.new(1,2), Pair.new(1,3), Pair.new(1,4), Pair.new(1,5),
            Pair.new(1,6), Pair.new(2,1), Pair.new(2,7), Pair.new(3,1),
            Pair.new(3,3), Pair.new(3,4), Pair.new(3,5), Pair.new(3,7),
            Pair.new(4,1), Pair.new(4,3), Pair.new(4,5), Pair.new(4,7),
            Pair.new(5,2), Pair.new(5,3), Pair.new(5,4), Pair.new(5,5),
            Pair.new(5,7)]
  }
    
  def initialize(character)
    @char   = character.upcase()
    @bitmap = Letter::LETTERS[character.upcase()] #array of Pair objects
    @height = Letter.height(bitmap)
    @width  = Letter.width(bitmap)
    if bitmap.length == 0
        @width = 1
    end
  end
  
  def self.height(bitmap)
    return (bitmap.collect { |x| x.second }).max()
  end
  
  def self.width(bitmap)
    return (bitmap.collect { |x| x.first }).max()
  end
  
  def print_bitmap()
    puts "print_bitmap(): TODO"
  end

  def print_weeks_and_days()
    list = @bitmap.map do |pair|
        "Week #{pair.first}, Day #{pair.second}."
    end
    return list
  end

  def print_weeks_and_days2()
    weeks = [[],[],[],[],[],[]]
    @bitmap.each do |pair|
        weeks[pair.first].push(pair.second)
    end
    week_num = 0
    weeks.each do |week|
        output = "Week #{week_num}:"
        if !week.empty?
            week.each do |day|
                output += " #{day}"
            end
        puts output
        end
        week_num += 1
    end
  end
  
  binding.pry
  nil
end