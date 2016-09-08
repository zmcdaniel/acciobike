class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.string :brand
      t.string :model
      t.string :color_primary
      t.string :color_secondary
      t.string :color_tertiary
      t.string :serial_num
      t.boolean :is_stolen
      t.integer :stolen_zip
      t.string :stolen_date
      t.text :photo
      t.string :frame_size

      t.timestamps null: false
    end
  end
end
