class CreateAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnos do |t|
      t.integer :cedula
      t.string :nombre
      t.string :apellido
      t.string :lugar_nacimiento
      t.date :fecha_nacimiento
      t.string :domicilio
      t.string :celular
      t.string :mutualista
      t.string :emergencia
      t.string :procede
      t.integer :anio_ingreso

      t.timestamps
    end
  end
end
