class Contents::Folder < Content
  has_many :contents, class_name: 'Content', foreign_key: 'folder_id'

  before_destroy :destroy_contents

  private

    def destroy_contents
      contents.destroy_all
    end
end
