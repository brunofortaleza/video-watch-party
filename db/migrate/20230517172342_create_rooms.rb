class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :video_url
      t.bigint :views, default: 0

      t.timestamps
    end
  end
end
