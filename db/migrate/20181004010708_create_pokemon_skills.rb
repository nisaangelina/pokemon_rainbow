class CreatePokemonSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_skills do |t|
      t.references :skill, foreign_key: true
      t.references :pokemon, foreign_key: true
      t.integer :current_pp , null: false

      t.timestamps
    end
  end
end
