ActiveAdmin.register Opcion do

  menu priority: 105, label: 'Opciones', parent: 'Administración'

  permit_params :id, :nombre, :grado_id, :anio

  index do
  	#selectable_column
    column :id
    column :nombre
    column "Grado" do |r| r.grado_tostr() end
    column :anio

    actions
  end

  filter :id
  filter :nombre

  show do
    attributes_table do
      row :id
      row :nombre
      row "Grado" do |r| r.grado_tostr() end
      row :anio
    end
  end

  form do |f|    
    f.inputs do
      f.input :id
      f.input :nombre
      f.input :grado_id, :label => 'Grado', :as => :select, :collection => Grado.collection()
      f.input :anio
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
