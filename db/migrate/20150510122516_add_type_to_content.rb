class AddTypeToContent < ActiveRecord::Migration
  def up
    add_column :contents, :type, :string
    execute <<-SQL
      UPDATE contents SET type = 'Contents::File';
    SQL
  end

  def down
    remove_column :contents, :type
  end
end
