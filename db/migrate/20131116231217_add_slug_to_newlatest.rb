class AddSlugToNewlatest < ActiveRecord::Migration
  def change
    add_column :newlatests, :slug, :string
    add_index :newlatests, :slug, unique: true
  end
end
