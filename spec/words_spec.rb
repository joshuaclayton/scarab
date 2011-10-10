require "spec_helper"

describe Scarab::Words, ".all" do
  subject      { Scarab::Words.all }

  its(:length) { should_not be_zero }
  it           { should include("ruby") }
  it           { should include("frozen") }
end

describe Scarab::Words, ".two_letter_words" do
  subject      { Scarab::Words.two_letter_words }

  its(:length) { should_not be_zero }

  it "contains only two-letter words" do
    subject.map(&:length).each do |length|
      length.should == 2
    end
  end
end

describe Scarab::Words, ".three_letter_words" do
  subject      { Scarab::Words.three_letter_words }

  its(:length) { should_not be_zero }

  it "contains only three-letter words" do
    subject.map(&:length).each do |length|
      length.should == 3
    end
  end
end

