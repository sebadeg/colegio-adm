class CreateCuentas < ActiveRecord::Migration[5.2]
  def change
    create_table :cuentas do |t|
      t.string :nombre
      t.text :comentario
      t.text :info

      t.timestamps
    end
  end
end
