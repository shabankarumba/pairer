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

  def pair_people 
    unless !even_number_of_people?
      @names.sample(@names.count).each_slice(2) do |pair|
        if same_name?(pair) && @names.count >= 4
          @names.sample(@names.count)
        elsif same_name?(pair) && @names.count <= 2
          nil
        else
          @names - [pair.flatten]
          @pairs << pair
        end
      end
    end
  end

  def even_number_of_people?
    @names.count.even?
  end

  def same_name?(pair)
    pair.all? do |name|
      pair.count(name) > 1 ? true : false
    end
  end

  def output_the_names
    partnerships = ""
    @pairs.map do |pair|
      partnerships << "#{pair.first} is pairing with #{pair.last}"
    end
    partnerships
  end
end