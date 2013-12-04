# -*- encoding : utf-8 -*-
class CreateNewlatests < ActiveRecord::Migration
  def change
    create_table :newlatests do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
