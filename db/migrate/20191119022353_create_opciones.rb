class CreateOpciones < ActiveRecord::Migration[5.2]
  def change
    create_table :opciones do |t|
      t.belongs_to :grado, foreign_key: true
      t.string :nombre
      t.integer :anio

      t.timestamps
    end
  end
end
