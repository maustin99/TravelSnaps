class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :picture_url
      t.string :caption
      t.string :city
      t.string :country
      t.integer :rating
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
