class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.integer :list_id
      t.string :title
      t.string :reference_id
      t.string :show_type
      t.timestamps
    end
  end
end
