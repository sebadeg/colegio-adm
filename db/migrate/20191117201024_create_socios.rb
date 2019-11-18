class CreateSocios < ActiveRecord::Migration[5.2]
  def change
    create_table :socios do |t|
	  t.integer :cedula
      t.string :nombre
	  t.string :apellido
	  t.string :email
	  t.string :domicilio
	  t.string :celular
	  t.date :fecha_ingreso
	  t.date :fecha_egreso

      t.timestamps
    end
  end
end
