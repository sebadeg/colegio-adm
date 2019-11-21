class CreateListas < ActiveRecord::Migration[5.2]
  def change
    create_table :listas do |t|
      t.string :nombre
      t.integer :anio

      t.timestamps
    end
  end
end
