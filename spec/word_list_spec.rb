require "spec_helper"

describe Scarab::WordList do
  context "basic stuff" do
    subject { Scarab::WordList.new("fatedh") }

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
    subject { Scarab::WordList.new("fr??en") }

    its(:length)  { should_not be_zero }
    its(:longest) { should include("frozen") }

    it { should include("frozen") }
    it { should_not include("brazen") }
  end

  context "matching" do
    context "without matches" do
      subject          { Scarab::WordList.new("fated").matching(/en$/) }
      its(:length)     { should be_zero }
      its(:max_length) { should be_zero }
      its(:longest)    { should be_empty }
    end

    context "with matches" do
      subject { Scarab::WordList.new("sefatedh").matching(/t.d$/) }
      it { should include("fated") }
      it { should include("hated") }
      it { should_not include("steed") }
    end
  end
end
