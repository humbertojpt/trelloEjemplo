class Task < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true
	validates :title, presence: true
	validates :duration, :numericality => {:only_float => true}
end
