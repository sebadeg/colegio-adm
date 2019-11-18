ActiveAdmin.register Socio do

  menu priority: 801, label: "Socios", parent: "Sociedad"

  permit_params :id, :nombre, :apellido, :fecha_ingreso, :fecha_egreso, :cedula, :domicilio, :email, :celular, :telefono

  scope :todos 
  scope :activos
  scope :suscriptores

  index do
    column :cedula
    column :nombre
    column :apellido
    column :email
    column :domicilio
    column :celular
    column :fecha_ingreso
    column :fecha_egreso

    actions
  end

  filter :nombre
  filter :apellido

  show do
    attributes_table do
      row :cedula
      row :nombre
      row :apellido
      row :email
      row :domicilio
      row :celular
      row :fecha_ingreso
      row :fecha_egreso
    end
  end

  form do |f|
    f.inputs do
      f.input :cedula
      f.input :nombre
      f.input :apellido
      f.input :email
      f.input :domicilio
      f.input :celular
      f.input :fecha_ingreso
      f.input :fecha_egreso
    end
    f.actions
  end

  csv do
    column :nombre
    column :apellido
    column :fecha_ingreso
  end

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
