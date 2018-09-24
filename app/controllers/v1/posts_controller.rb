class V1::PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    render json: @post, status: :created
  end

  def destroy
    @post.where(id: params[:id]).first

    if @post.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def index
    @posts = Post.all
    render json: @posts, status: :created
  end

  private
    def post_params
      params.require(:post).permit(:name, :desc)
    end
end