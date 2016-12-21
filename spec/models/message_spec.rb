require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with a text, image, user_id, group_id" do
      message = build(:message)
      expect(message).to be_valid
    end
    it "is invalid without a text" do
      message = build(:message, text: "")
      message.valid?
      expect(message.errors[:text]).to include("can't be blank")
    end
  end
end
