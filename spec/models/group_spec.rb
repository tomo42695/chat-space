require 'rails_helper'

describe Group do
  let (:group) { create(:group)}
  describe '#create' do
    it "is valid with a name" do
      expect(group).to be_valid
    end
    it "is invalid without a without a name" do
      group[:name] = ""
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end
  end
end
