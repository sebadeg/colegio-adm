class CreateActividadOpciones < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad_opciones do |t|
      t.belongs_to :actividad, foreign_key: true
      t.integer "indice"
      t.belongs_to :actividad_opcion_concepto, foreign_key: true
      t.date "fecha"
      t.integer "cuotas"
      t.decimal "importe"

      t.timestamps
    end
  end
end
