class Task < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true
	validates :title, presence: true
	validates :duration, :numericality => {:only_float => true}

validate :fecha_de_vencimiento

   def fecha_de_vencimiento
     if !finish_date.blank? and finish_date < start_date
       errors.add(:fecha_de_vencimiento, "no puede estar en el pasado")
     end
   end

end
