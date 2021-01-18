class Image < ApplicationRecord
  include ActiveModel::Validations

  mount_uploader :image, ImageUploader

  validates :image, file_size: { in: 100.kilobytes..2.megabyte }
end
