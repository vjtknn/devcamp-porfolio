class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'post'
  def index
    @topics = Topic.with_blogs
  end

  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:site_admin)
      @posts = @topic.posts.recent.page(params[:page]).per(5)
    else
      @posts = @topic.posts.published.recent.page(params[:page]).per(5)
    end
  end

  private
  def set_sidebar_topics
    @sidebar_topics = Topic.with_blogs
  end
end
