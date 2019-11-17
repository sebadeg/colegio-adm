ActiveAdmin.register AdminUsuario do

  menu priority: 1001, label: "Usuarios", parent: "Usuarios"

  permit_params :email,
    :acceso,
    :password,
    :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :acceso
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :acceso
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
