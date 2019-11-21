class CreateActividadOpcionConceptos < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad_opcion_conceptos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
