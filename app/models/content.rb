class Content < ActiveRecord::Base
  belongs_to :user

  mount_uploader :file, FileUploader

  validates :file, :name, presence: true
  validates :name, uniqueness: { scope: :user, message: "Файл уже существует" }
end
