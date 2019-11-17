class CreateGrados < ActiveRecord::Migration[5.2]
  def change
    create_table :grados do |t|
      t.string :nombre
      t.integer :proximo_grado_id
      
      t.timestamps
    end
  end
end
