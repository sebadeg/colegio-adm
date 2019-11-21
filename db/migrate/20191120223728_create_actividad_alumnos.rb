class CreateActividadAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad_alumnos do |t|
      t.belongs_to :actividad, foreign_key: true
      t.belongs_to :alumno, foreign_key: true
      t.boolean :mail
      t.datetime :bajado
      t.date :fecha
      t.integer :opcion
      t.date :fecha_secretaria
      t.integer :opcion_secretaria

      t.timestamps
    end
  end
end
