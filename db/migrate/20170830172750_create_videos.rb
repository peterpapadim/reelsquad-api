class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.integer :list_id
      t.string :title
      t.string :video_type
      t.timestamps
    end
  end
end
