class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index, :react_portfolio],
         user: {except: [:destroy, :new, :create, :update, :edit]},
         site_admin: :all
  layout "portfolio"
  def index
    @portfolio_items = Portfolio.all
  end

  def react_portfolio
    @react_portfolio_items= Portfolio.react
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |f|

      if @portfolio_item.save
        f.html {redirect_to portfolios_path,
                notice: "Congratulations! You've created new portfolio item"}
      else
        format.html { render :new  }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {redirect_to portfolios_path, notice: "You've edited your portfolio item"}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio item was removed" }
    end
  end

  private
  def portfolio_params
     params.require(:portfolio).permit(:title,
                                       :subtitle,
                                       :body,
                                        technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
