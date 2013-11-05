class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :releasedate
      t.string :cover
      t.belongs_to :artist

      t.timestamps
    end
    add_index :albums, :artist_id
  end
end
