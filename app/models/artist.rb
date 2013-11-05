class Artist < ActiveRecord::Base
  has_many :albums
  has_many :musics, :through => :albums
  attr_accessible :country, :name, :release
end
