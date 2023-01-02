class ImageController < ApplicationController
  skip_before_action :verify_authenticity_token

  # In your controller
def upload_images
  images = params[:image]
    File.open(Rails.root.join("public/images", images.original_filename), "wb") do |file|
      file.write(images.read)
    end
    
end


end
