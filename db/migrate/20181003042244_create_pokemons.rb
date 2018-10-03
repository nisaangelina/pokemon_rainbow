class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.references :pokedex, foreign_key: true
      t.string :name , null: false
      t.integer :level , null: false
      t.integer :max_health_point , null: false
      t.integer :current_health_point , null: false
      t.integer :attack , null: false
      t.integer :defence , null: false
      t.integer :speed , null: false
      t.integer :current_experience , null: false

      t.timestamps
    end
  end
end
