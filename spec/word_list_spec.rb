require "spec_helper"

describe Scarab::WordList do
  context "basic stuff" do
    subject { Scarab::WordList.new("fatedh").to_a }

    its(:length) { should_not be_zero }

    it { should include("fate") }
    it { should include("ate") }
    it { should include("date") }
    it { should include("hated") }

    it { should_not include("fart") }
    it { should_not include("father") }
    it { should_not include("fathered") }
    it { should_not include("dated") }
    it { should_not include("aah") }
  end

  context "wildcards" do
    subject { Scarab::WordList.new("fr??en").to_a }

    its(:length) { should_not be_zero }

    it { should include("frozen") }
    it { should_not include("brazen") }
  end
end
