class Contents::File < Content
  mount_uploader :file, FileUploader

  validates :file, presence: true
end
