class CreateCuentaAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :cuenta_alumnos do |t|
      t.belongs_to :cuenta, foreign_key: true
      t.belongs_to :alumno, foreign_key: true

      t.timestamps
    end
  end
end
