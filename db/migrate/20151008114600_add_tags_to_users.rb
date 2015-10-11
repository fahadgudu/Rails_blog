class AddTagsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag_ids, :integer, array: true, default: []
    add_index :users, :tag_ids, using: 'gin'
  end
end
