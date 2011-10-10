require "spec_helper"

describe Scarab::Parser, "#expand" do
  context "with a single wildcard" do
    subject { Scarab::Parser.new("f?b").expand }

    it { should include("fab") }
    it { should include("fzb") }
    it { should include("ffb") }
    it { should include("fbb") }
    it { should_not include("fb") }
    it { should_not include("ffbb") }
  end

  context "with multiple wildcards" do
    subject { Scarab::Parser.new("f??b").expand }

    it { should include("faab") }
    it { should include("fazb") }
    it { should include("ffbb") }

    it { should_not include("fb") }
  end

  context "without wildcards" do
    subject { Scarab::Parser.new("fab").expand }

    it { should == ["fab"] }
  end
end

