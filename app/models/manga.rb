class Manga < ActiveRecord::Base
    belongs_to :creator
    belongs_to :genre
    belongs_to :user
end 