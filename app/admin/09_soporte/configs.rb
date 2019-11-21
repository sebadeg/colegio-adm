ActiveAdmin.register Config do

  menu priority: 901, label: "Config", parent: "Soporte"

  permit_params :id, :nombre, :valor

  index do
    #selectable_column
    column :nombre
    column :valor
    actions
  end

  show do
    attributes_table do
      row :nombre
      row :valor
    end
  end

  form do |f|
    f.inputs do
      f.input :nombre
      f.input :valor
    end
    f.actions
  end

end
