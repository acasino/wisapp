class AvatarUploader < CarrierWave::Uploader::Base
    storage :file

    storage :file
    
    def store_dir
      "images"
    end
    
    def cache_dir
      "images/tmp"
    end
    
    def extension_whitelist
      %w(jpg jpeg gif png)
    end
    
    def content_type_whitelist
      /image\//
    end
    
end

