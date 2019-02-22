class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.belongs_to :zoo, foreign_key: true

      t.timestamps
    end
  end
end
