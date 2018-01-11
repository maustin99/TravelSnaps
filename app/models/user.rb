class User < ApplicationRecord

    has_secure_password
    
    mount_uploader :avatar, AvatarUploader

    has_many :pictures, dependent: :destroy
    has_many :comments, dependent: :destroy
end
