ActiveAdmin.register Factura do

  menu priority: 301, label: "Facturas", parent: "Facturación"

  permit_params :id, :cuenta_id, :fecha, :fecha_vencimiento, :fecha_pagos, :total, :dolar, :bajado,
    linea_factura_attributes: [:id,:factura_id,:alumno_id,:indice,:descripcion,:importe,:_destroy]

  member_action :descargar, method: :put do

    factura = Factura.find(params[:id]) rescue nil
    if factura != nil
      file_name = "factura_#{factura.cuenta_id}_#{factura.id}.pdf"
      file = Tempfile.new(file_name)
      factura.imprimir(file.path)

      send_file(
        file.path,
        filename: file_name,
        type: "application/pdf"
      )
    else
      redirect_to admin_facturas_path
    end
  end

  index do
    column :id
    column "Cuenta" do |r| r.cuenta_tostr() end
    column :fecha
    column :fecha_vencimiento
    column :fecha_pagos
    column :total
    column :dolar
    column :bajado

    actions defaults: true do |u|
      item "Descargar", descargar_admin_factura_path(u), class: "member_link", method: :put, title: "Descargar"
    end
  end

  filter :id
  filter :cuenta_id
  filter :fecha

  show do |r|
    attributes_table do
      row :id
      row "Cuenta" do |r| r.cuenta_tostr() end
      row :fecha
      row :fecha_vencimiento
      row :fecha_pagos
      row :total
      row :dolar
      row :bajado

      row "Líneas" do 
        table_for LineaFactura.where("factura_id=#{r.id}").order(:indice) do |t|
          t.column :indice
          t.column "Alumno" do |r| r.alumno_tostr() end
          t.column :descripcion
          t.column :importe
        end
      end      
    end
  end

  form partial: 'form'

  controller do

    def show
      @page_title = "#{resource.nombre_clase}: #{resource.tostr()}"
    end

    def edit
      @page_title = "#{resource.nombre_clase}: #{resource.tostr()}"
    end

    def update
      update! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end

    def create
      create! do |format|
        format.html { redirect_to collection_path } if resource.valid?
      end
    end
  end

end
