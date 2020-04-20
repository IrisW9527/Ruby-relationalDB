class User < ApplicationRecord
	# validates :autotoken, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    before_create :generate_authentication_token!


	# has_secure_password
	has_one :profile, dependent: :destroy
	has_and_belongs_to_many :groups
	has_many :photos, dependent: :destroy

	# def build_profile
	# 	Profile.create
	# 	true
	# end

	def generate_authentication_token!
	    begin
	    	# devise has a function generating random tokens
	      self.autotoken = Devise.friendly_token
	    end while self.class.exists?(autotoken: autotoken)
	end


end
