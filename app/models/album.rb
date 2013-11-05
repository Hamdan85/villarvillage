class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :musics, :dependent => :destroy
  attr_accessible :cover, :name, :releasedate,
                  :artist, :artist_id
end
