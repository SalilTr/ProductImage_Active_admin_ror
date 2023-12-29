class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  # Optionally, you can configure the storage path and filename
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Optionally, you can set the allowed file extensions
  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  # Optionally, you can configure the filename to use a secure token
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  # Generate a unique filename with a secure token
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
