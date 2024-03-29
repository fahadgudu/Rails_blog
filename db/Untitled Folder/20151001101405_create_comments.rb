class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.string :author
      t.text :body

      t.timestamps null: false
    end
  end
end
