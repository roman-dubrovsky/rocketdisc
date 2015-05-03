class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.references :user, index: true
      t.string :file

      t.timestamps null: false
    end
    add_foreign_key :contents, :users
  end
end
