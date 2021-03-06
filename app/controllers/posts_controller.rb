class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:toggle_status, :update, :create, :destroy]
  access all: [:show, :index],
         user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]},
         site_admin: :all
  layout "post"
  # GET /posts
  # GET /posts.json
  def index
    if logged_in?(:site_admin)
      @posts = Post.page(params[:page]).per(5).recent
    else
      @posts = Post.published.page(params[:page]).per(5).recent
    end

    @page_title = "My Portfolio Blog"
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if logged_in?(:site_admin) || @post.published?
      @post = Post.includes(:comments, :topic).friendly.find(params[:id])
      @topic = @post.topic
      @comments = @post.comments
      @comment = Comment.new
      @page_title = @post.title
      @seo_keywords = @post.body
    else
      redirect_to blogs_path, notice: 'URL is not valid'
    end

  end

  # GET /posts/new
  def new
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
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end
    redirect_to posts_url, notice: "Status of post has been changed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :topic_id, :status  )
    end

    def set_sidebar_topics
      @sidebar_topics = Topic.with_blogs
    end
end
