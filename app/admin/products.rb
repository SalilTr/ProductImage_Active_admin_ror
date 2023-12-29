ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :admin_user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :admin_user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
ActiveAdmin.register Product do
  permit_params :name, :description, :price, :admin_user_id,:image
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :admin_user
    column :image do |product|
      if product.image.present?
        image_tag product.image.url, height: '50'
      else
        'No Image'
      end
    end
    actions
  end
  
filter:name  
  

    
  

  

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :admin_user_id, as: :select, collection: AdminUser.pluck(:email, :id)
      f.input :image, as: :file

    end
    f.actions
  end
end

