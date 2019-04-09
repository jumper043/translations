class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      flash[:success] = "Comment saved"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Something went wrong"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :body)
    end

    def set_post
      @post = Post.friendly.find(params[:post_id])
    end
end
