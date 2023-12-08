ActiveAdmin.register Account do
  permit_params :first_name, :last_name, :city, :password

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :city 
    end
    f.actions
  end

  index  title: 'Account' do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :city 
    column :address 
    column :phone_number
    actions
  end

  show do
    attributes_table do
    # id_row
    row :first_name
    row :last_name
    row :city 
    row :address 
    row :phone_number

    end
  end

  filter :city
  filter :address
  filter :created_at 
  
end