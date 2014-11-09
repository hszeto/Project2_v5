class PostController < ApplicationController

  #skip_before_filter :authorize
# ----------------------- Post INDEX ---------------
  def index
  	@posts = Post.all
  end
# ----------------------- Post CREATE ---------------
# ---- current_user info is attacted to new post ----
  def create
  	@post = Post.new
  end
  def create_post
    @current_user = current_user
    @current_user.posts << Post.new(params.require(:post).permit(:title, :content))
  #	@post = Post.new(params.require(:post).permit(:title, :content))
  # if @post.save
	  if current_user.save
		  redirect_to post_path
	  else
	  	redirect_to post_path, notice: 'There was an error creating posts.'
	  end
  end
# ----------------------- Post EDIT -----------------
  def edit_post
    @post = Post.find(params[:post])
  end
  def update_post
    @post = Post.find(params[:post_id])
    if @post.update_attributes(params.require(:post).permit(:title, :content))
      redirect_to post_path 
    else
      render 'edit_post'
    end
  end
# ----------------------- Comment EDIT ------------
  def edit_comment
    @comment = Comment.find(params[:comment])
  end
  def update_comment
    @comment = Comment.find(params[:comment_id])
    if @comment.update_attributes(params.require(:comment).permit(:author, :comment))
      redirect_to post_path
    else
      render 'edit_comment'
    end
  end
# ----------------------- Comment SHOW ALL --------
  def one
  	@post = Post.find(params[:post])
    @comment = Comment.new
  end
# ----------------------- Comment NEW -------------
  def new_comment
     @id = params[:post_id]
     @post = Post.find(@id)
     @post.comments << Comment.new(params.require(:comment).permit(:author, :comment))
     if @post.save
      redirect_to one_path(:post => @id)
     end
  end
# ----------------------- DESTROY -------------------
 def destroy
    @post = Post.find(params[:post])
    @post.destroy
    redirect_to post_path
 end

end

