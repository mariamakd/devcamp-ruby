class PortfoliosController < ApplicationController
	layout "portfolio"
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]

	def index
		@portfolio_items=Portfolio.by_position
	end

	def angular
		@angular_portfolio_items=Portfolio.angular
	end



	def new
		@portfolio_item = Portfolio.new
		3.times{@portfolio_item.technologies.build}
	end

	def show
    end

	def edit
 	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
		respond_to do |format|
	       if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
	       else
	       	format.html{render :new}
	       end
		end
	end

	def update
		respond_to do |format|
		    if @portfolio_item.update(portfolio_params)
		        format.html { redirect_to portfolios_url, notice: 'Portfolio Item successfully updated.' }
		    else
	       		format.html{render :edit}
		    end
    	end
	end

	def destroy
	    @portfolio_item.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: 'Portfolio Item successfully destroyed.' }
	    end
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    private
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body,technologies_attributes:[:name])
    end

end
