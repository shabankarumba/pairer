require 'spec_helper'
require "./lib/pairer"

describe Pairer do
  describe "#pair_people" do
    it "returns pairs of people" do
      subject.should_receive(:pair_people).and_return([["Sabah Whelan", "Eugeneia Seward"], ["Jaswinder Wood", "Jordan Dimitriou"], ["Kun Wendell", "Karen Cloutier"], ["Boris Vela", "Maria Benini"], ["Sunan Hoffmann", "Jaya Lecce"]])
      subject.pair_people 
    end

    it "returns nil if there are only two people left" do
      subject.names = [ ["Sabah Whelan", "Sabah Whelan"]]
      subject.pair_people.should eq nil
    end

    it "randomises the pairs if there are two names in an array of four names" do
      subject.names = [ "Sabah Whelan", "Sabah Whelan", "Jaswinder Wood", "Jordan Dimitriou" ]
      subject.should_receive(:pair_people).and_return([["Jordan Dimitriou", "Sabah Whelan"], ["Sabah Whelan", "Jaswinder Wood"]])
      subject.pair_people
    end
  end

  describe "#pair_people same name" do
    before do
      subject.names = [ "Kun Wendell", "Kun Wendell","Sabah Whelan", "Jordan Dimitriou" ]
    end

    it "doesn't pair with people with the same name" do
      subject.pair_people.should eq nil 
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