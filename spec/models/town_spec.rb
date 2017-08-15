require 'rails_helper'

RSpec.describe Town, type: :model do
  describe "#new" do
    it "has no denounces" do
      town = Town.new
      expect(town).to have(0).denounces
    end
  end
end
