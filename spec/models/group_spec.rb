require 'rails_helper'
describe Group do
  describe '#create' do
    it "is valid with a name" do
      group = build(:group)
      expect(group).to be_valid
    end
    it "is invalid without a without a name" do
      group = build(:group, name: "")
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end
  end
end
