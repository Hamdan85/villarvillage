# -*- encoding : utf-8 -*-
class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :releasedate
      t.belongs_to :artist

      t.timestamps
    end
    add_index :albums, :artist_id
  end
end
