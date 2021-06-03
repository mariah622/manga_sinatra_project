class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :title
      t.integer :year
      t.integer :rating
      t.integer :genre_id
      t.integer :creator_id
      t.integer :user_id
    end 
  end
end
