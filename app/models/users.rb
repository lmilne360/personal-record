class User < ActiveRecord::Base
	has_many :exercises
has_secured_password
end