class PostsController < ApplicationController
  before_action :set_post_and_user, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @user = User.find(params[:user_id])
    @posts = Post.feed_items(@user)
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was successfully created.' }
      else
        format.html { redirect_to :back }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path(user_id: @user.id), notice: 'Post was successfully updated.' }
      else
        format.html { redirect_to posts_path(user_id: @user.id) }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path(user_id: @user.id), notice: 'Post was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_and_user
      @post = Post.find(params[:id])
      @user = @post.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:has_item, :has_description, :has_image, :wants_item, :wants_description, :wants_image, :user_id)
    end
end
