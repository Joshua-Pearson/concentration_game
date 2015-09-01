class AddMatchedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :matched, :boolean
  end
end
