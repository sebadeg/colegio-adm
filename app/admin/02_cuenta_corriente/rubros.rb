ActiveAdmin.register Rubro do

  menu priority: 201, label: "Rubros", parent: "Cuenta Corriente"

  permit_params :id, :nombre, :descripcion

  index do
    column :id
    column :nombre
    column :descripcion
    actions
  end

  filter :id
  filter :nombre
  filter :descripcion

  show do
    attributes_table do
      row :id
      row :nombre
      row :descripcion
    end
  end

  form do |f|
    f.inputs do
      f.input :id
      f.input :nombre
      f.input :descripcion
    end
    f.actions
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
