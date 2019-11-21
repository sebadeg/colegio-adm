ActiveAdmin.register Lista do

  menu priority: 501, label: "Listas", parent: "Secretaría"

  permit_params :id, :nombre, :anio, :locale, 
    lista_alumno_attributes: [:id,:lista_id,:alumno_id,:_destroy,:locale]

  scope "Año corriente", default: true
  scope :todas 

  index do
    column :nombre
    column :anio
    actions
  end  

  filter :nombre

  show do |r|
    attributes_table do
      row :nombre
      row :anio

      row "Alumnos" do 
        table_for Alumno.where("id in (SELECT alumno_id FROM lista_alumnos WHERE lista_id=#{r.id})").order(:nombre,:apellido) do |t|
          t.column :nombre
          t.column :apellido
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :nombre
      if f.object == nil || f.object.new_record?
        f.input :anio, :input_html => { :value => Config.anio_corriente } #, as: :hidden
      else
        f.input :anio, :input_html => { :value => f.object.anio } #, as: :hidden
      end
    end
    f.inputs do
      f.has_many :lista_alumno, heading: "Alumnos", allow_destroy: true, new_record: true do |l|
        l.input :alumno_id, :label => "Alumno", :as => :select, :collection => Alumno.all.order(:nombre,:apellido).map{|u| [u.to_str, u.id]}
      end
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
