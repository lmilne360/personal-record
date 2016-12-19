class User < ActiveRecord::Base
	validates :name, presence: true
	validates :password, presence:true
	has_many :exercises

has_secure_password
end