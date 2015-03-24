class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    styles: { content: '800>', thumb: '118x100#' },
                    # :url => ":s3_domain_url",
                    # :path => "/spree/ckeditor/:id/:basename_:style.:extension",
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
                    path: "/files/:id/:basename_:style.:extension", #:style
                    url: ":s3_domain_url",
                    default_url: "/files/:id/:basename_:style.:extension"


  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
