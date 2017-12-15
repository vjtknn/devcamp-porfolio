class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show]
  def index
    @portfolio_items = Portfolio.all
  end

  def show

  end

  def new
    @portfolio_item = Portfolio.new
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
  end

  private
  def portfolio_params
     params.require(:portfolio).permit(:title, :subtitle, :body)
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
