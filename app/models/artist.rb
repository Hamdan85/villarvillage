class Artist < ActiveRecord::Base
  has_many :albums,:dependent => :destroy
  has_many :musics, :through => :albums, :dependent => :destroy
  attr_accessible :country, :name, :release
end
