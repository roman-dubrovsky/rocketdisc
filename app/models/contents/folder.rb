class Contents::Folder < Content
  has_many :contents, class_name: 'Content', foreign_key: 'folder_id'
end
