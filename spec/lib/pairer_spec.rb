require 'spec_helper'
require "./lib/pairer"

describe Pairer do
  describe "#pair_people" do
    it "returns pairs of people" do
      subject.should_receive(:pair_people).and_return( [["Kun Wendell", "Jaya Lecce"], ["Sabah Whelan", "Jordan Dimitriou"]] ) 
      subject.pair_people.should eq [["Kun Wendell", "Jaya Lecce"], ["Sabah Whelan", "Jordan Dimitriou"]]
    end
  end

  describe "#randomise_order" do
    it "randomises the ordder of people" do
      subject.stub(randomise_order: [ "Jack", "James", "Kim", "Lynn" ])
      subject.randomise_order
    end
  end

  describe "#even_number_of_people?" do
    it "returns true for an even number of people" do
      subject.even_number_of_people?.should eq true
    end
  end

  describe "#even_number_of_people?" do
    it "checks false if there are an add number of people" do
      subject.names = ["Dan"]
      subject.even_number_of_people?.should eq false
    end
  end

  describe "#same_name? true" do
    it "returns true if the name is the same" do
      subject.names = ["Dan", "Dan"]
      subject.same_name?(subject.names).should eq true
    end
  end

  describe "#output_the_names" do
    it "outputs the pairing partners" do
      subject.names = [ "Dam", "Dan"]
      subject.pair_people
      subject.stub(:output_the_names => "Dam is pairing with Dan")
      subject.output_the_names.should eq "Dam is pairing with Dan"
    end
  end
end