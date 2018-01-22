class TopicsController < ApplicationController
  layout 'post'
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    if logged_in?(:site_admin)
      @posts = @topic.posts.recent.page(params[:page]).per(5)
    else
      @posts = @topic.posts.published.recent.page(params[:page]).per(5)
    end
  end
end
