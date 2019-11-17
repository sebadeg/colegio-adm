ActiveAdmin.register Usuario do

  menu priority: 102, label: "Padres", parent: "Administracion"

  permit_params :cedula,
    :nombre,
    :apellido,
    :lugar_nacimiento,
    :fecha_nacimiento,
    :domicilio,
    :celular,
    :profesion,
    :trabajo,
    :telefono_trabajo

  index do
    selectable_column
    id_column
    column :cedula
    column :nombre
    column :apellido
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
      row :domicilio
      row :celular
      row :profesion
      row :trabajo
      row :telefono_trabajo
      row :habilitado
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
      f.input :profesion
      f.input :trabajo
      f.input :telefono_trabajo
      f.input :habilitado
    end
    f.actions
  end

end
