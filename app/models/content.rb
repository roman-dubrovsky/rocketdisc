class Content < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  belongs_to :user
  belongs_to :folder, class_name: 'Contents::Folder'

  validates :name, :user, presence: true
  validates :name, uniqueness: { scope: :user, message: "Уже существует" }

  self.inheritance_column = :type
  def self.types
    %w(Contents::File Contents::Folder)
  end

  scope :files, -> {where(type: 'Contents::File')}
  scope :folders, -> {where(type: 'Contents::Folder')}
end
