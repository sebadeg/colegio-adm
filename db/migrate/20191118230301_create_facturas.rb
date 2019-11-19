class CreateFacturas < ActiveRecord::Migration[5.2]
  def change
    create_table :facturas do |t|
      t.belongs_to :cuenta, foreign_key: true
      t.date :fecha
      t.date :fecha_vencimiento
      t.date :fecha_pagos
      t.decimal :total
      t.decimal :dolar
      t.datetime :bajado

      t.timestamps
    end
  end
end
