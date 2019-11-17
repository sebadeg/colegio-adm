ActiveAdmin.register Cuenta do

  menu priority: 103, label: "Cuentas", parent: "Administracion"
  
  permit_params :id,
    :nombre,
    :comentario,
    :info

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
    end
  end


  form do |f|
    f.inputs do
      f.input :id
      f.input :nombre
      f.input :comentario
      f.input :info
    end
    f.actions
  end

end