class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :entries
    has_many :songs, through: :entries

end