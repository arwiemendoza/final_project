class Attachment < ApplicationRecord
    belongs_to :user

    mount_uploader :image, ImgUploader
end
