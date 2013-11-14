class Music < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  attr_accessible :duration, :genre, :name, :album, :album_id, :cover

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_avatar.gif"
end
