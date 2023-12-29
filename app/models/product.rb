class Product < ApplicationRecord
  belongs_to :admin_user, optional: true  
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["admin_user_id", "name", "description", "price", "created_at", "id", "updated_at", "image"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["admin_user"]
  end
end
