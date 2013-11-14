class AddAttachmentCoverToMusics < ActiveRecord::Migration
  def self.up
    change_table :musics do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :musics, :cover
  end
end
