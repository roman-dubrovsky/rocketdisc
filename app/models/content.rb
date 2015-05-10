class Content < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  belongs_to :user

  validates :name, :user, presence: true
  validates :name, uniqueness: { scope: :user, message: "Уже существует" }

  self.inheritance_column = :type
  def self.types
    %w(Contents::File)
  end
end
