class Document < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  mount_uploader :file, FileUploader
end
