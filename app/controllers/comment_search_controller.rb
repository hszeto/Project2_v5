class CommentSearchController < ApplicationController

	#skip_before_filter :authorize

	def find_author
		@search_author = User.find_by(:username => params[:author])
		
		@author_said = Comment.where(:user_id => @search_author)
	end

	def find
		@posts = Post.where(:'title' => params[:title])
	end

end
