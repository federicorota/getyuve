class Spree::BlogEntryImage < Spree::Image
  has_attached_file :attachment, 
    :styles => {
      pico: "16x16>",
      icon: "32x32>",
      mini: "48x48>",
      thumb: "50x50>",
      small: "100x100>",
      compact: "160x160>",
      medium: "240x240>",
      product: "240x240>",
      large: "480x480>",
      grande: "600x600>",
      super: "1024x1024>",
      extra: "2048x2048>",
    },

    :s3_credentials => {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      bucket: ENV['S3_BUCKET_NAME']
    },

    :default_style => :large,
    :storage=> :s3,
    :s3_headers => { "Cache-Control" => "max-age=31557600" },
    :s3_protocol => "http",
    :bucket => ENV["S3_BUCKET"],
    path: "/files/:id/:basename_:style.:extension",
    url: ":s3_domain_url",
    default_url: "/files/:id/:basename_:style.:extension"
end