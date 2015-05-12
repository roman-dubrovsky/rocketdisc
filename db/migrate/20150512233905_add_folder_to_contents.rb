class AddFolderToContents < ActiveRecord::Migration
  def change
    add_reference :contents, :folder, index: true
    add_foreign_key :contents, :contents, column: :folder_id
  end
end
