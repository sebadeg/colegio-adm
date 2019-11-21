ActiveAdmin.register ActividadOpcionConcepto do

  permit_params :id, :nombre

  menu priority: 907, label: "Concepto de opción de actividad", parent: "Soporte"

  index do
    column :nombre
    actions
  end  

  filter :nombre

  show do |r|
    attributes_table do
      row :nombre
    end
  end

  form do |f|
    f.inputs "Concepto" do
      f.input :nombre
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