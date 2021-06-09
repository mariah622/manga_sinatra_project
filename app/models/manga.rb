class Manga < ActiveRecord::Base
    belongs_to :creator
    belongs_to :genre
    belongs_to :user

    validates :title, :year, :rating, :genre_id, :creator_id, presence: true

    # t.string :title
    # t.integer :year
    # t.integer :rating
end 