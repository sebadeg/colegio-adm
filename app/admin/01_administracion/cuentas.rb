ActiveAdmin.register Cuenta do

  menu priority: 103, label: "Cuentas", parent: "Administración"
  
  permit_params :id,
    :nombre,
    :comentario,
    :info,
    titular_cuenta_attributes: [:id,:usuario_id,:cuenta_id,:_destroy],
    cuenta_alumno_attributes: [:id,:cuenta_id,:alumno_id,:_destroy]
    
  index do
  	#selectable_column
    selectable_column
    id_column
    column :nombre
    actions
  end

  filter :id
  filter :nombre

 show do |r|
    attributes_table do
      row :id
      row :nombre 
      row :comentario
      row :info

      row "Titular" do 
        table_for TitularCuenta.where("cuenta_id=#{r.id}") do |t|
          t.column "Titular" do |c| c.usuario_tostr() end
        end
      end
      row "Alumnos" do 
        table_for CuentaAlumno.where("cuenta_id=#{r.id}") do |t|
          t.column "Alumno" do |c| c.alumno_tostr() end
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