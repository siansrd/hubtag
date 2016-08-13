class Pair

  attr_reader :first, :second
  
  def initialize(fst, snd)
    @first  = fst
    @second = snd
  end
  
  def to_s()
    return "(#{@first},#{@second})"
  end
  
  def to_a()
    return [@first,@second]
  end
  
end
