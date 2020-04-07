class User < ApplicationRecord

	has_secure_password
	
	has_one :profile, dependent: :destroy
	has_and_belongs_to_many :groups
	has_many :photos, dependent: :destroy

end
