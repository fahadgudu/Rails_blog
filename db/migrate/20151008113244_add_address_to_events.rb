class AddAddressToEvents < ActiveRecord::Migration
  def change
    add_column :events, :city, :text, default: "Nowhere"
    add_column :events, :tag_ids, :integer, array: true, default: []
    add_index :events, :tag_ids, using: 'gin'
  end
end
