# -*- encoding : utf-8 -*-
class Artist < ActiveRecord::Base
  has_many :albums,:dependent => :destroy
  has_many :musics, :through => :albums, :dependent => :destroy
  attr_accessible :country, :name, :release, :avatar

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_avatar.gif"
end
