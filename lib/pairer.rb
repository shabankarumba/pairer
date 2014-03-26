require "pry"

class Pairer
  attr_accessor :names, :pairs

  def initialize
    @names = [

    "Kun Wendell",
    "Jaya Lecce",
    "Sabah Whelan",
    "Jordan Dimitriou",
    "Sunan Hoffmann",
    "Maria Benini",
    "Karen Cloutier",
    "Jaswinder Wood",
    "Eugeneia Seward",
    "Boris Vela"
    ]
    @pairs = []
  end

  def randomise_order
    @names.sample
  end

  def pair_people 
    first = 0
    second = 1
    unless !even_number_of_people?
      1.upto(@names.count / 2) do
        pair = @names[first..second] 
        @pairs << pair
        first += 2
        second += 2
      end
    end
  end
  
  def already_paired?(already_paired, pair_going_in)
    result = ""
    already_paired.flatten!.each do |paired|
      pair_going_in.sort.each do |pair|
        result = paired == pair ? true : false
      end
    end
    result
  end

  def even_number_of_people?
    @names.count.even?
  end

  def same_name?(pair)
    pair.all? do |name|
      pair.count(name) > 1 ? true : false
    end
  end
end