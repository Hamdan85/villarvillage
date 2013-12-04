# -*- encoding : utf-8 -*-
class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :musics, :dependent => :destroy
  attr_accessible :cover, :name, :releasedate,
                  :artist, :artist_id

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_avatar.gif"
end
