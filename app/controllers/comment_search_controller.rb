class CommentSearchController < ApplicationController

	#skip_before_filter :authorize

	def find_author
		@authors = Comment.where(:'author' => params[:author])
	end

	def find
		@posts = Post.where(:'title' => params[:title])
	end

end
