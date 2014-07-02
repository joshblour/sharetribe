class ListingImageS3OptionsJSAdapter < JSAdapter

  def initialize(listing)
    s3uploader = S3Uploader.new

    if BaseHelper.use_upload_s3?
      @s3_upload_path = s3uploader.url
      @s3_fields = s3uploader.fields
    end

    @save_from_file = listing.new_record? ? add_from_file_listing_images_path : add_from_file_listing_listing_images_path(listing.id)
    @save_from_url = listing.new_record? ? add_from_url_listing_images_path : add_from_url_listing_listing_images_path(listing.id)
    @max_image_filesize = APP_CONFIG.max_image_filesize
    @original_image_width = APP_CONFIG.original_image_width
    @original_image_height = APP_CONFIG.original_image_height
  end

  def to_hash
    Util::HashUtils.camelize_keys(Util::CamelizeHash.instance_hash(self), false)
  end
end