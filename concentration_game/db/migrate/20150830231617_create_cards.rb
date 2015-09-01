class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :deck, index: true, foreign_key: true
      t.integer :value
      t.string :suit
      t.string :face

      t.timestamps null: false
    end
  end
end
