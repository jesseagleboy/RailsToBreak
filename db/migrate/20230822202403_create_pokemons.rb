class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :card_id
      t.string :image_url
      t.integer :hp
      t.json :attacks
      t.string :weakness
      t.string :resistance
      t.string :energy_type
      t.timestamps
    end
  end
end
