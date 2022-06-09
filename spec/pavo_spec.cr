require "./spec_helper"

describe Pavo do
  describe "#similarity" do
    it "is true when strings are similar" do
      Pavo.similarity("Hello, world", "Hello, world").should eq 1.0
    end
  end
end
