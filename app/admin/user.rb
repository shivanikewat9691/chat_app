ActiveAdmin.register User do
  permit_params :name, :email, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :image, as: :file
    end
    f.actions
  end

  index  title: 'User' do
    selectable_column
    id_column
    column :full_name
    column :email
    column :image do |ad|
      image_tag(url_for(ad.image), size: '100x50')
    rescue StandardError => e
    end
    column :image_url do |ad|
      if ad.image.attached?
        link_to(url_for(ad.image))
      end
    end
    actions
  end
  show do
    attributes_table do
      row :id
      row :full_name
      row :email
      row :image  do |ad|
        image_tag(url_for(ad.image), size: '100x50')
      end
      row :image_url do |ad|
        if ad.image.attached?
          link_to(url_for(ad.image))
        end
      end
    end
  end
  filter :email
  filter :created_at  
end