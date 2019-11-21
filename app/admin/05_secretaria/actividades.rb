ActiveAdmin.register Actividad do

  actions :all
  menu priority: 502, label: "Actividades", parent: "Secretaría"

  permit_params :id, :nombre, :fecha, :rubro_id, :mail, :creada,
      actividad_archivo_attributes: [:id,:actividad_id,:nombre,:data,:indice,:_destroy],
      actividad_lista_attributes: [:id,:actividad_id,:lista_id,:_destroy],
      actividad_opcion_attributes: [:id,:actividad_id,:actividad_opcion_concepto_id,:cuotas,:importe,:fecha,:indice,:_destroy],
      actividad_alumno_attributes: [:id,:actividad_id,:alumno_id,:opcion,:fecha,:opcion_secretaria,:fecha_secretaria,:mail,:_destroy]

  scope "Año corriente", default: true
  scope :todas 

  action_item :asociar, only: :show do
    link_to "Asociar", asociar_admin_actividad_path(actividad), method: :put if !actividad.mail?
  end

  action_item :mail, only: :show do
    link_to "Mail", mail_admin_actividad_path(actividad), method: :put if !actividad.mail?
  end

  action_item :autorizar, only: :show do
    link_to "Autorizar", edit_admin_autorizar_path(actividad)
  end

  member_action :asociar, method: :put do
    id = params[:id]
    actividad = Actividad.find(id)

    ActiveRecord::Base.connection.execute( "DELETE FROM actividad_alumnos WHERE actividad_id=#{id};" )
    ActiveRecord::Base.connection.execute( "INSERT INTO actividad_alumnos (actividad_id,alumno_id,mail,created_at,updated_at) (SELECT #{id},id,false,now(),now() FROM alumnos WHERE id IN (SELECT alumno_id FROM lista_alumnos WHERE lista_id IN (SELECT lista_id FROM actividad_listas WHERE actividad_id=#{id})));" )

    redirect_to admin_actividad_path(actividad), notice: "Hecho!"
  end

  member_action :mail, method: :put do
    id = params[:id]
    actividad = Actividad.find(id)
    actividad.update(mail: true)

    SendMailActividadJob.set(wait: 10.seconds).perform_later

    redirect_to admin_actividad_path(actividad), notice: "Hecho!"
  end


  index do
    #selectable_column
    column :nombre
    column :fecha
    column "Rubro" do |r| r.rubro_tostr end
    actions
  end

  filter :nombre
  filter :fecha

  show do |r|
    attributes_table do
      row :nombre
      row :fecha
      row "Rubro" do |r| (r.rubro != nil ? "#{r.rubro.nombre}" : "" ) end

      row "Archivos" do 
        table_for ActividadArchivo.where("actividad_id=#{r.id}").order(:indice) do |t|
          t.column :indice
          t.column :nombre
        end
      end

      row "Listas" do 
        table_for Lista.where("id IN (SELECT lista_id FROM actividad_listas WHERE actividad_id=#{r.id})").order(:nombre) do |t|
          t.column :nombre
        end
      end

      row "Opciones" do 
        table_for ActividadOpcion.where("actividad_id=#{r.id}").order(:indice) do |t|
          t.column :indice
          t.column "Concepto" do |r| (r.opcion_concepto != nil ? "#{r.opcion_concepto.nombre}" : "" ) end
          t.column :cuotas
          t.column :importe
          t.column :fecha
        end
      end

      row "Alumnos" do 
        table_for ActividadAlumno.joins(:alumno).where("actividad_id=#{r.id}").order("alumnos.apellido,alumnos.nombre") do |t|
          t.column "Alumno" do |r| (r.alumno != nil ? "#{r.alumno.apellido} #{r.alumno.nombre}" : "") end
          t.column :mail
          t.column "Bajado" do |r| (r.bajado != nil ? r.bajado.strftime("%b %d, %Y") : "" ) end
          t.column "Opcion" do |r| ActividadOpcion.opcion_nombre_by_id(r.opcion) end
          t.column :fecha 
          t.column "Opcion Secretaría" do |r| ActividadOpcion.opcion_nombre_by_id(r.opcion_secretaria) end
          t.column :fecha_secretaria
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
