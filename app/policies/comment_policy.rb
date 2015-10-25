class CommentPolicy < ApplicationPolicy

	def intialize(user, comment)
		@user, @comment = user, comment
	end

	def create?
   		user.present?
	end

end
