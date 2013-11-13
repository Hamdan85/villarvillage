class AddSlugToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :slug, :string
    add_index :musics, :slug, unique: true
  end
end
