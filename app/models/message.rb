class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :text_or_image, presence: true
  mount_uploader :image, ImageUploader


  private
    def text_or_image
      text.presence or image.presence
    end
end
