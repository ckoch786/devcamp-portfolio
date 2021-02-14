class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
    #@portfolio_items = Portfolio.where(subtitle: 'Ruby on Rails')
    # better to use Custom scopes instead
    # @portfolio_items = Portfolio.angular 
    # by using def self.angular where(subtitle: 'Angular') end
    # or 
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items 
    # scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
    # this forces you to keep all the logic for the database in the model
    # the controller should just act as the traffic cop
  end
  
  
  # these work find but are really fragile because of the 
  # hard coded strings in the model, going to use techonologies instead
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: "Your  record was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # Perform the look up
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: "The record was removed." }
    end
  end
end
