class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	obfuscate_id
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "40x40>" }, :default_url => "/images/:style/missing.png"
	validates_attachment :avatar,
	 :size => { :in => 0..10.megabytes },
	 :content_type => {:content_type => /^image\/(jpeg|png|gif|tiff)$/ }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :tasks


	def fullname
		return name + " " + lastname
	end
	
end
