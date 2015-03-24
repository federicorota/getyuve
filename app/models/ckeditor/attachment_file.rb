class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => ":s3_domain_url",
                    :path => "/ckeditor/:id/:basename_:style.:extension",

                    :s3_credentials => {
      					access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      					secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      					bucket: ENV['S3_BUCKET_NAME']
      				},

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
