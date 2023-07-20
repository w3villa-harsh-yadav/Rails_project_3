class User < ApplicationRecord
    validates :user_name ,presence: true,uniqueness: true,length: {maximum: 20,minimum:5}
    validates :password ,presence: true,length: {maximum: 20,minimum:3}
    has_secure_password
    has_many :message
end
