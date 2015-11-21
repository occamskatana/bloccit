class Permission < Struct.new(:user)

	def allow?(controller, action)

		if user.nil?
			controller == "topics" && action.in?(%w[index show])
		else
			true
		end

	end

end