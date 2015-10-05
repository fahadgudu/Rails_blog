class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :start_time
      t.text :body
      t.text :author

      t.timestamps null: false
    end
  end
end
