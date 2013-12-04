# -*- encoding : utf-8 -*-
class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.string :genre
      t.time :duration
      t.belongs_to :album

      t.timestamps
    end
    add_index :musics, :album_id
  end
end
