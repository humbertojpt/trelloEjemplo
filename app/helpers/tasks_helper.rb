module TasksHelper
	def find_responsable(id)
		return User.find(id).fullname
	end
end
