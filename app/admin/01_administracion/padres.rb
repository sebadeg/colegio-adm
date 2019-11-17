ActiveAdmin.register Usuario do

  menu priority: 102, label: "Padres", parent: "Administracion"

  permit_params :id,
    :cedula,
    :nombre,
    :apellido,
    :lugar_nacimiento,
    :fecha_nacimiento,
    :email,
    :domicilio,
    :celular,
    :profesion,
    :trabajo,
    :telefono_trabajo,
    padre_alumno_attributes: [:id,:usuario_id,:alumno_id,:_destroy],
    titular_cuenta_attributes: [:id,:cuenta_id,:usuario_id,:_destroy]

  index do
    selectable_column
    id_column
    column :cedula
    column :nombre
    column :apellido
    column :email
    actions
  end

  filter :cedula
  filter :nombre
  filter :apellido

  show do |r|
    attributes_table do
      row :id
      row :cedula
      row :nombre
      row :apellido
      row :lugar_nacimiento
      row :fecha_nacimiento
      row :email
      row :domicilio
      row :celular
      row :profesion
      row :trabajo
      row :telefono_trabajo
      row :habilitado

      row "Hijos" do 
        table_for PadreAlumno.where("usuario_id=#{r.id}") do |t|
          t.column "Alumno" do |c| c.alumno_tostr() end
        end
      end
      row "Cuentas" do 
        table_for TitularCuenta.where("usuario_id=#{r.id}") do |t|
          t.column "Cuentas" do |c| c.cuenta_tostr() end
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
