class Music < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  attr_accessible :duration, :genre, :name, :album, :album_id

  extend FriendlyId
  friendly_id :name, use: :slugged
end
