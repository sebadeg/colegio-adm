ActiveAdmin.register Alumno do

  menu priority: 101, label: "Alumnos", parent: "Administracion"

  permit_params
    :cedula,
    :nombre,
    :apellido,
    :lugar_nacimiento,
    :fecha_nacimiento,
    :domicilio,
    :celular,
    :mutualista,
    :emergencia,
    :procede,
    :anio_ingreso

  index do
    selectable_column
    id_column
    column :cedula
    column :nombre
    column :apellido
    actions
  end

  filter :id
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
      row :domicilio
      row :celular
      row :mutualista
      row :emergencia
      row :procede
      row :anio_ingreso
    end
  end

  form do |f|
    f.inputs do
      f.input :id
      f.input :cedula
      f.input :nombre
      f.input :apellido
      f.input :lugar_nacimiento
      f.input :fecha_nacimiento
      f.input :domicilio
      f.input :celular
      f.input :mutualista
      f.input :emergencia
      f.input :procede
      f.input :anio_ingreso
    end
    f.actions
  end

end
