class CreateActividades < ActiveRecord::Migration[5.2]
  def change
    create_table :actividades do |t|
      t.string :nombre
      t.date :fecha
      t.belongs_to :rubro, foreign_key: true
      t.boolean :mail, default: false

      t.timestamps
    end
  end
end
